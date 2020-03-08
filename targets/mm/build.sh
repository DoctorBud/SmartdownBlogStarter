export target=${0%/*}
cd ${target}

rm -rf _site

bundle exec jekyll build \
	--config=_config.yml \
	--destination=_site \
	--baseurl=/SmartdownBlogStarter

ls -l _site
ls -l _site/posts
ls -l _site/categories

# Amend the built _site
touch _site/.nojekyll
rm _site/*.sh
# cp _site/categories/index.md _site/categories/index.html
# cp _site/posts/index.md _site/posts/index.html
cp -r assets/ _site/assets/
cp -r ../../img/ _site/img/

ls -l _site/
