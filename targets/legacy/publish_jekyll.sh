export target=${0%/*}
export tmp="/tmp/dist"

# Remove traces of prior builds
rm -rf ${target}/dist
rm -rf ${target}/_site
rm -rf ${tmp}

# Construct Jekyll source to be deployed
mkdir ${tmp}
cp -r ${target} ${tmp}/
cp ${target}/_config.yml ${tmp}/
cp ${target}/../../index.html ${tmp}/
cp ${target}/../../404.html ${tmp}/
cp -r ${target}/../../_posts ${tmp}/
cp -r ${target}/../../_pages ${tmp}/
cp -a ${target}/../../_rawposts ${tmp}/
cp -a ${target}/../../_rawpages ${tmp}/
cd ${tmp}/
mkdir targets
mv legacy/assets ./
mv legacy targets/legacy
rm targets/legacy/Gemfile*
rm targets/legacy/*.sh
rm targets/legacy/_config.yml
# exit

# Push it
REMOTE=`git remote get-url --push origin`
git init
git add .
git commit -m "Initial commit"
git remote add origin ${REMOTE}
git push --force origin master:gh-pages
