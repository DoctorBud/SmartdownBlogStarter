target="targets/legacy/"
exec="bundle exec --gemfile=${target}Gemfile"
config="${target}_config.yml"
echo "target: ${target}"
echo "config: ${config}"
echo "exec: ${exec}"

rm -rf ${target}_site/
${exec} jekyll docs --config ${config}
