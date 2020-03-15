# build.sh targetName [optionalBaseSuffix]
#
#

baseUrl="/"
REMOTE=`git remote get-url --push origin`
if [[ $REMOTE =~ ^([^/]+)/([[:alpha:]]+)\.git$ ]]; then
	baseUrl="/${BASH_REMATCH[2]}"
fi

export here=${0%/*}
if [ "$1" == "" ]; then
    echo "# $0 usage: $0 targetName"
    exit 1
fi

export targetName="${1}"
export target="${here}/${targetName}"

if [ "$2" != "" ]; then
	baseUrl="${baseUrl}/$2"
fi

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
	--baseurl=${baseUrl}

# Amend the built _site
touch _site/.nojekyll
