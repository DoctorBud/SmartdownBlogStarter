export target=${0%/*}
exec="bundle exec --gemfile=${target}/Gemfile"
config="${target}/_config.yml"

rm -rf ${target}/_site/
${exec} jekyll serve \
	--config ${config} \
	--destination ${dest} \
	--baseurl /SmartdownBlogStarter
