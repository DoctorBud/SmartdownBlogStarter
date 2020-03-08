export target=${0%/*}
exec="bundle exec --gemfile=${target}/Gemfile"
config="${target}/_configLocal.yml"
dest="${target}/_site"

rm -rf ${dest}
mkdir ${dest}
mkdir ${dest}/categories/
mkdir ${dest}/posts/
# ln -s ${target}/assets/ ${dest}/assets
ln -s index.md ${dest}/categories/index.html
ln -s index.md ${dest}/posts/index.html
ls -l ${dest}/categories
ls -l ${dest}/posts

${exec} jekyll serve \
	--config=${config} \
	--destination=${dest} \
	--baseurl=
