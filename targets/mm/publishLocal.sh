REMOTE=`git remote get-url --push origin`

export target=${0%/*}
export dest="/tmp/dist"

# Remove traces of prior builds
rm -rf ${target}/_site
rm -rf ${dest}

# Build locally
${target}/buildLocal.sh

# Construct site to be deployed
cp -r ${target}/_site ${dest}

ln -s index.md ${dest}/categories/index.html
ln -s index.md ${dest}/posts/index.html

cd ${dest}
touch .nojekyll

# Push it
git init
git add .
git commit -m "Initial commit"
git remote add origin ${REMOTE}
git push --force origin master:gh-pages
