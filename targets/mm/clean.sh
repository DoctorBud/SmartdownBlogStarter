export target=${0%/*}

exec="bundle exec --gemfile=${target}/Gemfile"
config="${target}/_config.yml"
dest="${target}/_site/"

${exec} jekyll clean \
	--config ${config} \
	--destination ${dest}

rm -rf ${target}/dist/
rm -f ${target}/.jekyll-metadata
rm -rf ${target}/.jekyll-cache/
rm -rf ${target}/.sass-cache/
rm -rf ${target}/_site/
