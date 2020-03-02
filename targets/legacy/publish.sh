export target=${0%/*}
${target}/build.sh

REMOTE=`git remote get-url --push origin`
rm -rf ${target}/dist
cp -r ${target}/_site/ ${target}/dist/
cd ${target}/dist/
git init
git add .
git commit -m "Initial commit"
git remote add origin ${REMOTE}
git push --force origin master:gh-pages