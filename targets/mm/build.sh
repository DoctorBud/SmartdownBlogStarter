export target=${0%/*}
cd ${target}

# Adjust target directory to look like a Jekyll site
./sync.sh

# Prepare build directory
rm -rf _site
mkdir _site

bundle exec jekyll build \
	--baseurl=/SmartdownBlogStarter

# Amend the built _site
touch _site/.nojekyll

