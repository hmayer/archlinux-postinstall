#!/bin/bash

echo -en "Verifying dependencies... "
/bin/bash ./init.sh &> /dev/null
echo -en "OK\n"

DIALOG=`which dialog`
TITLE="Archlinux postinstall"

start() {
  ${DIALOG} --title "${TITLE}" --msgbox "Welcome to Archlinux postinstall wizard

The next list show you categories of applications to be installed.
Choose one and see what can be installed on each one.
" 0 0
}

selectCategory() {
  local FOLDERS=$(find ./ -mindepth 1 -maxdepth 1 -type d | grep -v -E ".git|lib")
  local CATEGORIES=$(basename -a ${FOLDERS})
  for CATEGORY in ${CATEGORIES}; do
    MENU="${MENU} ${CATEGORY} ${CATEGORY}"
  done
  local CATEGORY=$(${DIALOG} --stdout --title "${TITLE}" --menu "Select a category" 0 0 0 ${MENU})
  echo $CATEGORY
}

selectScripts() {
  local CATEGORY=$1
  local SCRIPTS=$(find ./${CATEGORY}/ -type f -name "*.sh")
  for SCRIPT in ${SCRIPTS}; do
    SOFT=$(basename ${SCRIPT} .sh)
    LIST="${LIST} ${SOFT} OFF"
  done
  SELECTED_SCRIPTS=$(${DIALOG} --no-items --stdout --checklist "What want you to intall?" 0 0 0 ${LIST})
  echo ${SELECTED_SCRIPTS}
}

start
CATEGORY=`selectCategory`
SCRIPTS=`selectScripts ${CATEGORY}`
clear
for INSTALLER in ${SCRIPTS}; do
  echo -en "Installing ${INSTALLER}, please wait..."
  /bin/bash ./${CATEGORY}/${INSTALLER}.sh &> /dev/null
  echo -en " OK\n"
done
echo -en "Installation done\n"
