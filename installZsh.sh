#!/bin/bash
#Script prepares my custom ZSH distribution

OMP_CONF_DIR='.config/omp'

if [ ! -d "${HOME}/${OMP_CONF_DIR}" ] ; then
  mkdir -p "${HOME}/${OMP_CONF_DIR}"
else
  echo "${HOME}/${OMP_CONF_DIR} exist."
fi

# if [ ! -d "${HOME}/${VIM_PACK_DIR}/vendor/start/cleverf" ] ; then
#   mkdir "${HOME}/${VIM_PACK_DIR}/vendor/start/cleverf"
#   git clone https://github.com/rhysd/clever-f.vim.git "${HOME}/${VIM_PACK_DIR}/vendor/start/cleverf"
# else
#   echo "${HOME}/${VIM_PACK_DIR}/vendor/start/cleverf exist."
# fi

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

if [ ! -f "${HOME}/.zshrc" ] ; then
  cp ./.zshrc ${HOME}/.zshrc
else
  echo '.zshrc file exist, backup has been created as a .zshrc.bkp file'
  cp ${HOME}/.zshrc ${HOME}/.zshrc.bkp
  cp ./.zshrc ${HOME}/.zshrc
fi

if [ ! -f "${HOME}/.zshenv" ] ; then
  cp ./.zshenv ${HOME}/.zshenv
else
  echo '.zshenv file exist, backup has been created as a .zshenv.bkp file'
  cp ${HOME}/.zshenv ${HOME}/.zshenv.bkp
  cp ./.zshenv ${HOME}/.zshenv
fi

if [ ! -f "${HOME}/.local/bin/oh-my-posh" ] ; then
  curl -s https://ohmyposh.dev/install.sh | bash -s -- -d ~/.local/bin
fi
