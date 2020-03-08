export target=${0%/*}
cd ${target}

rm -rf _site

bundle exec jekyll build \
	--config=_config.yml \
	--destination=_site

# Amend the built _site
touch _site/.nojekyll
rm _site/*.sh
ln -s index.md _site/categories/index.html
ln -s index.md _site/posts/index.html
cp -r assets/ _site/assets/
cp -r ../../img/ _site/img/

ls -l _site/
