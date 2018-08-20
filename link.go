package main

import (
	"os"
	"os/user"
	"path/filepath"
	"strings"
)

func main() {
	blacklist := []string{"./", ".git/", ".gitignore", "link.go"}
	var files []string

	err := filepath.Walk("./", func(path string, info os.FileInfo, _ error) error {
		for _, v := range blacklist {
			if (info.IsDir() && !strings.Contains(path, "/")) || strings.HasPrefix(path, v) {
				return nil
			}
		}

		files = append(files, path)
		return nil
	})
	if err != nil {
		panic(err)
	}

	usr, _ := user.Current()
	pwd, _ := os.Getwd()

	for _, file := range files {
		source := filepath.Join(pwd + "/" + file)
		target := filepath.Join(usr.HomeDir + "/" + file)

		if link, _ := os.Readlink(target); link != "" {
			continue
		}

		if _, err := os.Stat(target); !os.IsNotExist(err) {
			err := os.Rename(target, target+".bak")
			if err != nil {
				panic(err)
			}
		}

		err := os.Symlink(source, target)
		if err != nil {
			panic(err)
		}
	}
}
