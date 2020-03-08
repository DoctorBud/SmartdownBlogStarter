export target=${0%/*}
REMOTE=`git remote get-url --push origin`
${target}/build.sh

rm -rf dist
cp -r _site/ dist/
cd dist
git init
git add .
git commit -m "Initial commit"
git remote add origin ${REMOTE}
git push --force origin master:gh-pages
