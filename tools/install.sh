#如果存在路径.oh-my-zsh
if [ -d ~/.oh-my-zsh ]
then
  echo "\033[0;33mYou already have Oh My Zsh installed.\033[0m You'll need to remove ~/.oh-my-zsh if you want to install"
  #给出提示信息
  #     你已经账户已经存在一个Oh My Zsh 
  #     <退出>
  exit
fi

#运用git进行克隆
echo "\033[0;34mCloning Oh My Zsh...\033[0m"
hash git >/dev/null && /usr/bin/env git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh || {
  echo "git not installed"
  #提示未安装git
  #   <退出>
  exit
}

#判断是否存在.zshrc
echo "\033[0;34mLooking for an existing zsh config...\033[0m"
if [ -f ~/.zshrc ] || [ -h ~/.zshrc ]
then
  echo "\033[0;33mFound ~/.zshrc.\033[0m \033[0;32mBacking up to ~/.zshrc.pre-oh-my-zsh\033[0m";
  mv ~/.zshrc ~/.zshrc.pre-oh-my-zsh;
  #提示存在.zshrc
  #.zshrc 备份
fi

#使用oh my zsh 模板文件
echo "\033[0;34mUsing the Oh My Zsh template file and adding it to ~/.zshrc\033[0m"
#文件复制
cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc

#添加PATH路径
echo "\033[0;34mCopying your current PATH and adding it to the end of ~/.zshrc for you.\033[0m"
echo "export PATH=\$PATH:$PATH" >> ~/.zshrc

#更改默认SHELL
echo "\033[0;34mTime to change your default shell to zsh!\033[0m"
chsh -s `which zsh`

echo "\033[0;32m"'         __                                     __   '"\033[0m"
echo "\033[0;32m"'  ____  / /_     ____ ___  __  __   ____  _____/ /_  '"\033[0m"
echo "\033[0;32m"' / __ \/ __ \   / __ `__ \/ / / /  /_  / / ___/ __ \ '"\033[0m"
echo "\033[0;32m"'/ /_/ / / / /  / / / / / / /_/ /    / /_(__  ) / / / '"\033[0m"
echo "\033[0;32m"'\____/_/ /_/  /_/ /_/ /_/\__, /    /___/____/_/ /_/  '"\033[0m"
echo "\033[0;32m"'                        /____/                       '"\033[0m"

#提示安装完毕
echo "\n\n \033[0;32m....is now installed.\033[0m"
/usr/bin/env zsh
source ~/.zshrc
