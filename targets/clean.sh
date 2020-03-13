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

cd ${target}

bundle exec jekyll clean

rm -rf assets/
rm -rf _pages/
rm -rf _posts/
rm -f _rawpages
rm -f _rawposts
rm -rf dist/
rm -f .jekyll-metadata
rm -rf .jekyll-cache/
rm -rf .sass-cache/
rm -rf _site/

