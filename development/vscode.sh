#!/bin/bash
#
# Install Microsoft Visual Studio Code
#

CURRENTDIR=$(dirname $(readlink -f $0))
CODE=/usr/bin/code

#load helpers
. ${CURRENTDIR}/../lib/helpers.sh

arch-install code
arch-install trash-cli
arch-install xdg-utils
arch-install perl-file-mimeinfo
arch-install x11-ssh-askpass

# installing vscode extensions
${CODE} --install-extension felixfbecker.php-debug
${CODE} --install-extension felixfbecker.php-intellisense
${CODE} --install-extension mehedidracula.php-namespace-resolver
${CODE} --install-extension onecentlin.laravel-blade
${CODE} --install-extension onecentlin.laravel5-snippets
${CODE} --install-extension ryannaddy.laravel-artisan
${CODE} --install-extension codingyu.laravel-goto-view

${CODE} --install-extension mikestead.dotenv
${CODE} --install-extension editorconfig.editorconfig
${CODE} --install-extension foxundermoon.shell-format
${CODE} --install-extension yzhang.markdown-all-in-one

${CODE} --install-extension eamodio.gitlens
${CODE} --install-extension ms-azuretools.vscode-docker
${CODE} --install-extension humao.rest-client

${CODE} --install-extension alefragnani.bookmarks
${CODE} --install-extension gruntfuggly.todo-tree
${CODE} --install-extension wayou.vscode-todo-highlight

${CODE} --install-extension formulahendry.auto-close-tag
${CODE} --install-extension christian-kohler.path-intellisense
${CODE} --install-extension coenraads.bracket-pair-colorizer-2
${CODE} --install-extension naumovs.color-highlight
${CODE} --install-extension dbaeumer.vscode-eslint
${CODE} --install-extension xabikos.javascriptsnippets
${CODE} --install-extension octref.vetur

${CODE} --install-extension stuart.unique-window-colors

