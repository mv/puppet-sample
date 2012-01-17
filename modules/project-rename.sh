#!/bin/bash
#
# project-rename.sh
#     Renames all references of 'old-project' to a 'new-project' string
#     Based on 'project_rename.sh' from github.com/example42
#

usage() {
	echo
	echo "Usage: $0 'old-project' 'new-project'"
	echo
	echo "    Renames all references of 'example42' to a new project string."
	echo "    Must be run inside a module directory."
	echo
	exit 2
}

[ -z "$2" ] && usage

[ ! -f manifests/init.pp ] && {
    echo
    echo "Cannot find 'manifests/init.pp'."
    usage
}

echo
echo "Renaming manifest"
for file in $( find . -name ${1}.pp )
do
    newfile=`echo $file | sed -e "s/$1/$2/"`
	if /bin/mv ${file} ${newfile}
	then echo "Renamed: ${file} ${newfile}"
	else echo "Error: cannot find ${file}"
	fi
done

echo
echo "Renaming dir"
for dir in $( find . -name ${1} )
do
    newdir=`echo $dir | sed -e "s/$1/$2/"`
	if /bin/mv ${dir} ${newdir}
	then echo "Renamed: ${dir} ${newdir}"
	else echo "Error: cannot find ${dir}"
	fi
done

echo
echo "Changing references"
for file in $( find . -type f )
do
    if grep "$1" $file > /dev/null
	then perl -pi -e "s/$1/$2/g" $file && echo "Changed: $file"
	fi
done

echo

# vim:ft=sh:

