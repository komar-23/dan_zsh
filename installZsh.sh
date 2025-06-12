#!/bin/bash
#Script prepares my custom ZSH distribution
echo 'ZSH customization installer'

OMP_CONF_DIR='.config/omp'
VI_MO=1000

while [[ VI_MO -ne 0 && VI_MO -ne 1 && VI_MO -ne 2 ]]  ; do
  echo 'Please choose VI motion support in ZSH :'
  echo '0. Quit'
  echo '1. Simple'
  echo '2. Advanced (with zsh-vi-mode plugin and visualisation)'
  echo 'Important! In advanced mode fzf-git plugin is not spported.'
  read -p "Enter your choice [0-2]: " VI_MO
done

if [ $VI_MO -eq 0 ] ; then
  echo 'Bye!'
  exit 0;
fi

echo 'Start installation process ...'
if [ ! -d "${HOME}/${OMP_CONF_DIR}" ] ; then
  mkdir -p "${HOME}/${OMP_CONF_DIR}"
else
  echo "${HOME}/${OMP_CONF_DIR} exist."
fi

if [ ! -f "${HOME}/${OMP_CONF_DIR}/dan_vim.omp.json" ] ; then
  cp ./.config/omp/dan_vim.omp.json ${HOME}/${OMP_CONF_DIR}/dan_vim.omp.json
else
  echo 'dan_vim.omp.json file exist, backup has been created as a dan_vim.omp.json.bkp file'
  cp ${HOME}/${OMP_CONF_DIR}/dan_vim.omp.json ${HOME}/${OMP_CONF_DIR}/dan_vim.omp.json.bkp
  cp ./.config/omp/dan_vim.omp.json ${HOME}/${OMP_CONF_DIR}/dan_vim.omp.json
fi

if [ ! -f "${HOME}/${OMP_CONF_DIR}/dan_norm.omp.json" ] ; then
  cp ./.config/omp/dan_norm.omp.json ${HOME}/${OMP_CONF_DIR}/dan_norm.omp.json
else
  echo 'dan_norm.omp.json file exist, backup has been created as a dan_norm.omp.json.bkp file'
  cp ${HOME}/${OMP_CONF_DIR}/dan_norm.omp.json ${HOME}/${OMP_CONF_DIR}/dan_norm.omp.json.bkp
  cp ./.config/omp/dan_norm.omp.json ${HOME}/${OMP_CONF_DIR}/dan_norm.omp.json
fi

if [ ! -f "${HOME}/${OMP_CONF_DIR}/ompvimode" ] ; then
  cp ./.config/omp/ompvimode ${HOME}/${OMP_CONF_DIR}/ompvimode
else
  echo 'ompvimode file exist, backup has been created as a ompvimode.bkp file'
  cp ${HOME}/${OMP_CONF_DIR}/ompvimode ${HOME}/${OMP_CONF_DIR}/ompvimode.bkp
  cp ./.config/omp/ompvimode ${HOME}/${OMP_CONF_DIR}/ompvimode
fi

case $VI_MO in
  1)
    if [ ! -f "${HOME}/.zshrc" ] ; then
      cp ./.zshrc_norm ${HOME}/.zshrc
    else
      echo '.zshrc file exist, backup has been created as a .zshrc.bkp file'
      cp ${HOME}/.zshrc ${HOME}/.zshrc.bkp
      cp ./.zshrc_norm ${HOME}/.zshrc
    fi
    ;;
  2)
    if [ ! -f "${HOME}/.zshrc" ] ; then
      cp ./.zshrc_vim ${HOME}/.zshrc
    else
      echo '.zshrc file exist, backup has been created as a .zshrc.bkp file'
      cp ${HOME}/.zshrc ${HOME}/.zshrc.bkp
      cp ./.zshrc_vim ${HOME}/.zshrc
    fi
    ;;
  *) echo 'Error - something goes worng!'
    ;;
esac

if [ ! -f "${HOME}/.zshenv" ] ; then
  cp ./.zshenv ${HOME}/.zshenv
else
  echo '.zshenv file exist, backup has been created as a .zshenv.bkp file'
  cp ${HOME}/.zshenv ${HOME}/.zshenv.bkp
  cp ./.zshenv ${HOME}/.zshenv
fi

if [ ! -f "${HOME}/.local/bin/oh-my-posh" ] ; then
  mkdir -p "${HOME}/.local/bin"
  curl -s https://ohmyposh.dev/install.sh | bash -s -- -d ${HOME}/.local/bin
fi

if [ ! -f "${HOME}/.local/share/fzf-git/fzf-git.sh" ] ; then
  mkdir -p "${HOME}/.local/share/fzf-git"
  git clone https://github.com/junegunn/fzf-git.sh.git ${HOME}/.local/share/fzf-git 
fi

echo 'ZSH customization completed'
