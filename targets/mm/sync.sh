rm -rf _posts
rm -rf _pages

rm -f _rawposts
rm -f _rawpages
ln -s _posts _rawposts
ln -s _pages _rawpages

cp -r _theme_pages _pages
cp -r ../../_pages/* _pages

cp -r ../../_posts _posts

rm -rf assets
cp -r _theme_assets assets
cp -r ../../assets/* assets/
