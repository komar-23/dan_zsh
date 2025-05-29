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

if [ ! -f "${HOME}/${OMP_CONF_DIR/dan.omp.json" ] ; then
  cp ./.config/omp/dan.omp.json ${HOME}/${OMP_CONF_DIR/dan.omp.json
else
  echo 'dan.omp.json file exist, backup has been created as a dan.omp.json.bkp file'
  cp ${HOME}/${OMP_CONF_DIR/dan.omp.json ${HOME}/${OMP_CONF_DIR/dan.omp.json.bkp
  cp ./.config/omp/dan.omp.json ${HOME}/${OMP_CONF_DIR/dan.omp.json
fi

if [ ! -f "${HOME}/${OMP_CONF_DIR/ompvimode" ] ; then
  cp ./.config/omp/ompvimode ${HOME}/${OMP_CONF_DIR/ompvimode
else
  echo 'ompvimode file exist, backup has been created as a ompvimode.bkp file'
  cp ${HOME}/${OMP_CONF_DIR/ompvimode ${HOME}/${OMP_CONF_DIR/ompvimode.bkp
  cp ./.config/omp/ompvimode ${HOME}/${OMP_CONF_DIR/ompvimode
fi

ompvimode
