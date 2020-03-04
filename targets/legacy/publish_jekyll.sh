export target=${0%/*}
export tmp="/tmp/dist"

REMOTE=`git remote get-url --push origin`
rm -rf ${target}/dist
rm -rf ${target}/_site
rm -rf ${tmp}

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
ls -l
ls -l targets/legacy
# exit

git init
git add .
git commit -m "Initial commit"
git remote add origin ${REMOTE}
git push --force origin master:gh-pages
