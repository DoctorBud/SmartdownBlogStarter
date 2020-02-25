export target=${0%/*}
cd ${target}

bundle exec jekyll clean

rm -rf assets/
rm -rf _pages/
rm -rf _posts/
rm -f _rawpages
rm -f _rawposts
rm -rf dist/
rm -f .jekyll-metadata
rm -rf .jekyll-cache/
rm -rf .sass-cache/
rm -rf _site/
