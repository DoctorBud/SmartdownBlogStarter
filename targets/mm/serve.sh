export target=${0%/*}
exec="bundle exec --gemfile=${target}/Gemfile"
config="${target}/_config.yml"
dest="${target}/_site"

rm -rf ${dest}
mkdir ${dest}
ln -s ${target}/assets/ ${dest}/assets

${exec} jekyll serve \
	--config=${config} \
	--destination=${dest} \
	--baseurl=
