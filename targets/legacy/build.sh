export target=${0%/*}
exec="bundle exec --gemfile=${target}/Gemfile"
config="${target}/_config.yml"
dest="${target}/_site/"

rm -rf ${target}/_site/
${exec} jekyll build \
	--config ${config} \
	--destination ${dest} \
	--baseurl /SmartdownBlogStarter
