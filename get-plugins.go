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
		"ctrlpvim/ctrlp.vim",
		"fatih/vim-go",
		"junegunn/fzf",
		"junegunn/fzf.vim",
		"justinmk/vim-sneak",
		"lifepillar/vim-mucomplete",
		"ludovicchabant/vim-gutentags",
		"mhinz/vim-tmuxify",
		"romainl/vim-qf",
		"romainl/vim-qlist",
		"sheerun/vim-polyglot",
		"skywind3000/asyncrun.vim",
		"t9md/vim-quickhl",
		"tomtom/tlib_vim",
		"tomtom/ttags_vim",
		"tpope/vim-abolish",
		"tpope/vim-commentary",
		"tpope/vim-eunuch",
		"tpope/vim-fugitive",
		"tpope/vim-repeat.git",
		"tpope/vim-surround",
		"tpope/vim-vinegar",
		"wellle/targets.vim",
		"wellle/tmux-complete.vim",
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
	mustNotError(os.RemoveAll("pack/"))
	mustNotError(os.MkdirAll("pack/", 0777))
}

// TODO: use os.PathSeperator
func updatePlugin(wg *sync.WaitGroup, org, plugin string) {
	fullURL := "https://github.com/" + plugin
	localPath := "pack/" + org + "/start/" + strings.Replace(strings.Replace(strings.Replace(strings.ToLower(plugin), `/`, `-`, -1), `.vim`, `-vim`, 1), `_`, `-`, -1)

	mustNotError(os.MkdirAll(localPath, 0777))

	_, err := exec.Command("git", "clone", fullURL, localPath).CombinedOutput()
	mustNotError(err)

	mustNotError(os.RemoveAll(localPath + "/.git"))
	os.RemoveAll(localPath + "/.gitignore")

	docsPath := localPath + "/doc"
	docsExist, err := exists(docsPath)
	mustNotError(err)
	if docsExist {
		_, err := exec.Command("vim", "-c", "helptags "+docsPath+" | q").CombinedOutput()
		mustNotError(err)

	}

	log.Println(localPath, "done")
	wg.Done()
}

func mustNotError(err error) {
	if err != nil {
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
