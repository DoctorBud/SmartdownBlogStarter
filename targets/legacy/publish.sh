export target=${0%/*}
export tmp="/tmp/dist"

# Remove traces of prior builds
rm -rf ${target}/dist
rm -rf ${target}/_site
rm -rf ${tmp}

# Build locally
${target}/build.sh

# Construct site to be deployed
cp -r ${target}/_site/ ${target}/dist/
cd ${target}/dist/
touch .nojekyll

# Push it
REMOTE=`git remote get-url --push origin`
git init
git add .
git commit -m "Initial commit"
git remote add origin ${REMOTE}
git push --force origin master:gh-pages
