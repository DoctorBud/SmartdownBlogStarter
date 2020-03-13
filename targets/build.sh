export here=${0%/*}
if [ "$1" == "" ]; then
    echo "# $0 usage: $0 targetName"
    exit 1
fi

export targetName="${1}"
export target="${here}/${targetName}"

echo "here=${here}"
echo "targetName=${targetName}"
echo "target=${target}"

if [[ ! -d ${target} ]]
then
	echo "The target ${target} does not exist!"
	exit 1
fi

# Adjust target directory to look like a Jekyll site
${here}/sync.sh ${targetName}

cd ${target}

# Prepare build directory
rm -rf _site
mkdir _site

bundle exec jekyll build \
	--config=_config.yml \
	--destination=_site \
	--baseurl=/SmartdownBlogStarter/${targetName}

# Amend the built _site
touch _site/.nojekyll
