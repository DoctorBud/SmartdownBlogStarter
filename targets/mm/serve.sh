export target=${0%/*}
cd ${target}

rm -rf _site/
mkdir _site/
./sync.sh

syncChanges() {
	echo "+++ syncChanges"
	cp -v -r ../../_pages/* _pages/
	cp -v -r ../../_posts/* _posts/
	ls -l _posts
	pwd
	echo "--- syncChanges"
}

trap "kill 0" EXIT
(fswatch -o ../../_posts ../../_pages | while read f; do syncChanges; done) &

bundle exec jekyll serve \
	--config=_config.yml \
	--destination=_site/ \
	--baseurl=
