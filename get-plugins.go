package main

import (
	"context"
	"log"
	"os"
	"os/exec"
	"strings"
	"sync"
	"time"
)

func main() {
	var wg sync.WaitGroup
	wg.Add(1)

	// assumes github.com
	colors := []string{
		"robertmeta/nofrils",
		"romainl/Apprentice",
		"romainl/Disciple",
		"cormacrelf/vim-colors-github",
	}
	plugins := []string{
		"airblade/vim-gitgutter",
		"fatih/vim-go",
		"hauleth/asyncdo.vim",
		"joereynolds/vim-minisnip",
		"kopischke/vim-fetch",
		//"lifepillar/vim-mucomplete",
		"ludovicchabant/vim-gutentags",
		"machakann/vim-sandwich",
		"Olical/vim-enmasse",
		"prettier/vim-prettier",
		"romainl/vim-qf",
		"romainl/vim-qlist",
		"scrooloose/nerdtree",
		"t9md/vim-quickhl",
		"tpope/vim-abolish",
		"tpope/vim-commentary",
		"tpope/vim-eunuch",
		"tpope/vim-fugitive",
		"tpope/vim-repeat",
		"tpope/vim-rsi",
		"tpope/vim-unimpaired",
		//"tpope/vim-vinegar",
		"w0rp/ale",
		"wellle/tmux-complete.vim",
		"wincent/terminus",
		"xtal8/traces.vim",
	}

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
}

func clearPack() {
	mustNotError(os.RemoveAll("pack/"), "on pack")
	mustNotError(os.MkdirAll("pack/", 0777), "on mkdir2")
}

// TODO: use os.PathSeperator
func updatePlugin(wg *sync.WaitGroup, org, plugin string) {
	fullURL := "https://github.com/" + plugin
	localPath := "pack/" + org + "/start/" + strings.Replace(strings.Replace(strings.Replace(strings.ToLower(plugin), `/`, `-`, -1), `.vim`, `-vim`, 1), `_`, `-`, -1)
	log.Println(localPath, "started")

	mustNotError(os.MkdirAll(localPath, 0777), "on mkdir")

	ctx, cancel := context.WithTimeout(context.Background(), 15*time.Second)
	defer cancel()

	x, err := exec.CommandContext(ctx, "git", "clone", fullURL, localPath).CombinedOutput()
	mustNotError(err, "on clone:"+string(x))

	mustNotError(os.RemoveAll(localPath+"/.git"), "on removeall")
	os.RemoveAll(localPath + "/.gitignore")

	docsPath := localPath + "/doc"
	docsExist, err := exists(docsPath)
	mustNotError(err, "on exists")
	if docsExist {
		x, err := exec.CommandContext(ctx, "vim", "-c", "helptags "+docsPath+" | q").CombinedOutput()
		if err != nil { // don't crash, just error
			log.Println(string(x))
			log.Println(err)
		}
	}

	log.Println(localPath, "done")
	wg.Done()
}

func mustNotError(err error, note string) {
	if err != nil {
		log.Println(note)
		log.Fatal(err)
	}
}

func exists(path string) (bool, error) {
	_, err := os.Stat(path)
	if err == nil {
		return true, nil
	}
	if os.IsNotExist(err) {
		return false, nil
	}
	return true, err
}
