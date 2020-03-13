export target=${0%/*}
cd ${target}

# Adjust target directory to look like a Jekyll site
./sync.sh

# Prepare build directory
rm -rf _site
mkdir _site

bundle exec jekyll build \
	--config=_config.yml \
	--destination=_site \
	--baseurl=/SmartdownBlogStarter/legacy

# Amend the built _site
touch _site/.nojekyll
