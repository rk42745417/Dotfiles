#!/usr/bin/env bash

source variables

for d in $DIRECTORIES; do
	if [ ! -d $d ]; then
		mkdir "$d"
	fi
done

echo "Updating flies under ~"
for f in $FILES; do
	cp "$HOME/.$f" "$f"
done

echo "Updating files under ~/.newsboat"
for f in $NEWSBOAT_FILES; do
	cp "$HOME/.newsboat/$f" "newsboat/$f"
done

echo "Updating files under ~/.config"
for f in $CONFIG_FILES; do
	cp "$HOME/.config/$f" "$f" -rT
done

echo "Updating files in ~/.bin"
cp "$HOME/.bin" "bin" -rT
