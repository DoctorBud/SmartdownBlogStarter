export target=${0%/*}

config="${target}/_config.yml"
dest="${target}/_site/"

bundle exec jekyll clean \
	--config ${config} \
	--destination ${dest}

rm -rf ${target}/assets/
rm -rf ${target}/_pages/
rm -rf ${target}/_posts/
rm -f ${target}/_rawpages/
rm -f ${target}/_rawposts/
rm -rf ${target}/dist/
rm -f ${target}/.jekyll-metadata
rm -rf ${target}/.jekyll-cache/
rm -rf ${target}/.sass-cache/
rm -rf ${target}/_site/
