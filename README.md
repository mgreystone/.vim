# Jazzy's NeoVimrc

Hi, I'm Jazzy!
I :heart: nerding out about NeoVim and customizing the editor!

![Vim Screenshot](https://github.com/jasminabasurita/.vim/blob/master/vim.png)

| Packages I Use:                 |                                                    How I feel about them |
| ------------------------------- | -----------------------------------------------------------------------: |
| Vundle.vim                      |                                        Makes Plugin Management a Breeze! |
| nerdtree.git                    |                                                   Absolutely **Crucial** |
| vim-nerdtree-syntax-highlight   |                     Highlights nerdtree files and folders based on types |
| nerdtree-git-plugin             |                            Adds symbols when files have unstaged changes |
| vim-devicons                    |                                       Adds icons to nerdtree and airline |
| YouCompleteMe                   | So Helpful, keeps track of paths, variable names and built in functions! |
| auto-pairs                      |                        closes brackets and quotes! what's not to love?!? |
| vim-commentary                  |                                       Comment things out quick and easy! |
| vim-dracula                     |                                   Clean & simple theme, easy on the eyes |
| vim-javascript                  |                                          JavaScript Syntax Highlighting! |
| vim-javascript-syntax           |                                                more syntax highlighting! |
| vim-jsx                         |                                               React syntax highlighting! |
| javascript-libraries-syntax.vim |                                       I clearly like syntax highlighting |
| JavaScript-Indent               |                                                       Better Indentation |
| ale                             |     **I** _Love_ ALE. lints and fixes! asynchronous! _Essential_ package |
| vim-airline                     |                                      Makes me feel like a real developer |
| vim-bufferline                  |                               improved buffer management for vim-airline |
| vim-fugitive                    |                                              very featureful git wrapper |
| vim-gitgutter                   |                                          helps keep track of git changes |
| vim-json                        |                                       makes json files look so so pretty |
| jspc.vim                        |                                         keep track of recurring strings! |
| vim-surround                    |                    Again, I love not having to type both brackets myself |
| vim-indent-guides               |                    adds solid bars to indentations for better visibility |

### My Key Mappings

|      Keys      |        What they do         |
| :------------: | :-------------------------: |
|   `spacebar`   |      Mapped to leader       |
|   `leader+H`   |       Previous Buffer       |
|   `leader+L`   |         Next Buffer         |
| `leader+<1-9>` |     Switch to buffer #      |
|    `Ctrl+H`    |     Switch to left tile     |
|    `Ctrl+L`    |    Switch to right tile     |
|    `Ctrl+J`    |    Switch to bottom tile    |
|    `Ctrl+K`    |     Switch to top tile      |
|     `<F1>`     |      Toggle nerd tree       |
|     `<F2>`     |  Clear search highlighting  |
|    `Ctrl+P`    | :AleFix _i.e. use Prettier_ |

### Usage

1.  clone to user home
2.  symlink to appropriate place

* for NeoVim `ln -s ~/.vim/vimrc ~/.config/nvim/init.vim`
* for Vim `ln -s ~/.vim/vimrc ~/.vimrc`

3.  clone Vundle

* `git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim`

4.  Install YouCompleteMe following [this](https://github.com/Valloric/YouCompleteMe)
5.  Open NeoVim or Vim and run `:PluginInstall`
6.  Restart NeoVim/Vim and enjoy!
