export target=${0%/*}
exec="bundle exec --gemfile=${target}/Gemfile"
config="${target}/_configLocal.yml"
dest="${target}/_site"
dist="${target}/dist/"

rm -rf ${dest}
rm -rf ${dist}
mkdir ${dest}

${exec} jekyll build \
	--config=${config} \
	--destination=${dest} \
	--baseurl=

ln -s index.md ${dest}/categories/index.html
ln -s index.md ${dest}/posts/index.html

cp -r ${target}/assets/ ${dest}/assets/

rm -rf ${dest}/targets/

ls -l ${dest}
htp ${dest}
