export target=${0%/*}
exec="bundle exec --gemfile=${target}/Gemfile"
config="${target}/_config.yml"
dest="${target}/_site"
dist="${target}/dist/"

rm -rf ${dest}
rm -rf ${dist}
mkdir ${dest}
cp -r ${target}/assets/ ${dest}/assets/

${exec} jekyll build \
	--config=${config} \
	--destination=${dest}

cp -r ${dest}/targets/legacy/assets/css/main.css ${dest}/assets/css/main.css
rm -rf ${dest}/targets/
