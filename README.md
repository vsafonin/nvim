# My setup for neovim.
# Install requirements
- gcc
- fd-find
- python3-venv
- npm
# Instalation.
1. Install [neovim](https://github.com/neovim/neovim/blob/master/INSTALL.md)
```bash
wget https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
tar xvf nvim-linux64.tar.gz
sudo mv nvim-linux64 /opt/nvim
sudo ln -s /opt/nvim/bin/nvim /usr/local/bin/nvim
```
2. Install [packer](https://github.com/wbthomason/packer.nvim):
```bash
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```
3. Run nvim, and setup plugins.
```bash
nvim
```
```vimcmd
:PackerSync
```
4. Enjoy!
