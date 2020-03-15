REMOTE=`git remote get-url --push origin`

export here=${0%/*}
if [ "$1" == "" ]; then
    echo "# $0 usage: $0 targetName"
    exit 1
fi

export targetName="${1}"
export target="${here}/${targetName}"

if [[ ! -d ${target} ]]
then
	echo "The target ${target} does not exist!"
	exit 1
fi

# Adjust target directory to look like a Jekyll site
${here}/sync.sh ${targetName}

REMOTE=`git remote get-url --push origin`

blogRoots="/tmp/blogRoots"
dist="${blogRoots}/${targetName}"

${here}/build.sh ${targetName}

mkdir -p ${blogRoots}
rm -rf ${blogRoots}/.git

cd ${target}
rm -rf ${dist}
cp -r _site/ ${dist}
cd ${dist}

git init
git add .
git commit -m "Initial commit"
git remote add origin ${REMOTE}
git push --force origin master:gh-pages
