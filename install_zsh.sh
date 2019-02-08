
#!/usr/bin/env bash
# ZSH
echo "Installing Oh-my-zsh and PowerLevel9K"
sudo apt-get -y install zsh > /dev/null
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh > /dev/null
cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
## PowerLevel9K
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
sed -i 's~ZSH_THEME="robbyrussell"~ZSH_THEME="powerlevel9k/powerlevel9k"~' ~/.zshrc
sed -i '1s/^/export TERM="xterm-256color"\n/' ~/.zshrc
wget --quiet https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf
wget --quiet https://github.com/powerline/powerline/raw/develop/font/10-powerline-symbols.conf
mv PowerlineSymbols.otf /usr/share/fonts/X11/misc/
mkdir -p ~/.config/fontconfig/conf.d/
mv 10-powerline-symbols.conf ~/.config/fontconfig/conf.d/
fc-cache -vf ~/.fonts/ > /dev/null
echo "Done! Changes will take effect next session."
