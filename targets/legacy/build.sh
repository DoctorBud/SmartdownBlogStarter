export target=${0%/*}
cd ${target}

# Adjust target directory to look like a Jekyll site
./sync.sh

# Prepare build directory
rm -rf _site
mkdir _site
cp -r ../../img/ _site/img/
cp -r assets/ _site/assets/

bundle exec jekyll build \
	--config=_config.yml \
	--destination=_site \
	# --baseurl=/SmartdownBlogStarter

# Amend the built _site
touch _site/.nojekyll
