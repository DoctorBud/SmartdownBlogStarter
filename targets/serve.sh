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

cd ${target}

rm -rf _site/
mkdir _site/

syncChanges() {
	echo "+++ syncChanges"
	cp -v -r ../../_pages/* _pages/
	cp -v -r ../../_posts/* _posts/
	pwd
	echo "--- syncChanges"
}

trap "kill 0" EXIT
(fswatch -o ../../_posts ../../_pages | while read f; do syncChanges; done) &

bundle exec jekyll serve
