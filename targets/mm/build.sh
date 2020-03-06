export target=${0%/*}
exec="bundle exec --gemfile=${target}/Gemfile"
config="${target}/_config.yml"
dest="${target}/_site"
dist="${target}/dist/"

rm -rf ${dest}
rm -rf ${dist}
mkdir ${dest}

${exec} jekyll build \
	--config=${config} \
	--destination=${dest}

# echo "after jekyll"
# ls -l ${dest}

cp -r ${target}/assets/ ${dest}/assets/
# cp -r ${dest}/targets/mm/assets/css/main.css ${dest}/assets/css/main.css
rm -rf ${dest}/targets/

# echo "after postprocess"
# ls -l ${dest}
