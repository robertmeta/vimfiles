package main

import (
	"log"
	"os"
	"os/exec"
	"strings"
	"sync"
)

func main() {
	var wg sync.WaitGroup
	wg.Add(1)

	// assumes github.com
	colors := []string{
		"NLKNguyen/papercolor-theme",
		"robertmeta/nofrils",
		"romainl/Apprentice",
		"romainl/Disciple",
		"tomasr/molokai",
	}
	plugins := []string{
		"fatih/vim-go",
		"justinmk/vim-dirvish",
		"justinmk/vim-sneak",
		"lifepillar/vim-mucomplete",
		"ludovicchabant/vim-gutentags",
		"mhinz/vim-tmuxify",
		"romainl/vim-qf",
		"romainl/vim-qlist",
		"sheerun/vim-polyglot",
		"skywind3000/asyncrun.vim",
		"tpope/vim-abolish",
		"tpope/vim-commentary",
		"tpope/vim-eunuch",
		"tpope/vim-repeat.git",
		"tpope/vim-surround",
		"vim-scripts/MultipleSearch",
		"wellle/targets.vim",
		"wellle/tmux-complete.vim",
	}

	log.Println("start")
	clearPack()

	for _, v := range plugins {
		wg.Add(1)
		go updatePlugin(&wg, "plugins", v)
	}
	for _, v := range colors {
		wg.Add(1)
		go updatePlugin(&wg, "colors", v)
	}

	wg.Done()
	wg.Wait()
	log.Println("end")
}

func clearPack() {
	mustNotError(os.RemoveAll("pack/"))
	mustNotError(os.MkdirAll("pack/", 0777))
}

func updatePlugin(wg *sync.WaitGroup, org, plugin string) {
	fullUrl := "https://github.com/" + plugin
	localPath := "pack/" + org + "/start/" + strings.Replace(strings.Replace(strings.ToLower(plugin), `/`, `-`, -1), `.vim`, ``, 1)
	log.Println(fullUrl)
	log.Println(localPath)
	mustNotError(os.MkdirAll(localPath, 0777))
	_, err := exec.Command("git", "clone", fullUrl, localPath).CombinedOutput()
	mustNotError(err)
	mustNotError(os.RemoveAll(localPath + "/.git"))

	wg.Done()
}

func mustNotError(err error) {
	if err != nil {
		log.Fatal(err)
	}
}
