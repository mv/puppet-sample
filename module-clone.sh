#!/bin/bash
#
# module-clone.sh
#     Create a new module dir using 'foo' as a template
#     Based on 'module_clone.sh' from github.com/example42
#

usage() {
	echo
	echo "Usage: $0 'new-module-name'"
	echo
	echo "    Create a new module dir using 'foo' as a template"
	echo "    Must be run inside the directory which containts 'foo'."
	echo
	exit 2
}

[ -z "$1" ] && usage

FOO='foo'

[ ! -f ${FOO}/manifests/init.pp ] && {
    echo
    echo "Cannot find '${FOO}/manifests/init.pp'."
    usage
}

if /bin/cp -a "${FOO}" ${1}
then echo "Created: ${1}"
else echo "Error copying 'foo'"
 	 exit 1
fi

echo
echo "Renaming"
for file in $( find ${1} | grep ${FOO} )
do
    newfile=`echo $file | sed -e "s/$FOO/$1/"`
	if /bin/mv ${file} ${newfile}
	then echo "Renamed: ${file} ${newfile}"
	else echo "Error: cannot find ${file}"
	fi
done

echo
echo "Changing contents"
for file in $( find $1 -type f )
do
    if grep "$FOO" $file > /dev/null
	then perl -pi -e "s/$FOO/$1/g" $file && echo "Changed: $file"
	fi
done

echo
echo "Module $1 created"
echo "Edit $1/manifests/params.pp to customize it"
echo

# vim:ft=sh:

