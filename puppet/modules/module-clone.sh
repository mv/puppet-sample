#!/bin/bash
#
# module-clone.sh
#     Create a new module dir using 'foo' as a template
#     Based on 'module_clone.sh' from github.com/example42
#

usage() {
	echo
	echo "Usage: $0  'reference-module'  'new-module'"
	echo
	echo "    Create a new module using 'reference-module' as a template"
	echo "    Must be run inside 'modules/' directory."
	echo
	exit 2
}

[ -z "$2" ] && usage

REF="$1"
NEW="$2"

[ ! -f ${REF}/manifests/init.pp ] && {
    echo
    echo "Cannot find '${REF}/manifests/init.pp'."
    usage
}

if [ -d ${NEW} ]
then echo "Already exists: [ ${NEW} ]"
	 exit 1
fi

if /bin/cp -a "${REF}" "${NEW}"
then echo "Created: ${NEW}"
else echo "Error copying [${REF}]"
 	 exit 3
fi

echo
echo "Renaming"
for file in $( find ${NEW} | grep -w ${REF} )
do
    newfile=`echo $file | sed -e "s/$REF/${NEW}/"`
	if /bin/mv ${file} ${newfile}
	then echo "Renamed: ${file} ${newfile}"
	else echo "Error: cannot find ${file}"
	fi
done

echo
echo "Changing contents"
for file in $( find ${NEW} -type f )
do
    if grep "$REF" $file > /dev/null
	then perl -pi -e "s/${REF}/${NEW}/g" $file && echo "Changed: $file"
	fi
done

echo
echo "Module ${NEW} created"
echo "Edit ${NEW}/manifests/params.pp to customize it"
echo

# vim:ft=sh:

