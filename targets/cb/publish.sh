export target=${0%/*}
REMOTE=`git remote get-url --push origin`

targetname="cb"
blogroots="/tmp/blogroots"
dist="${blogroots}/${targetname}"

echo "targetname=${targetname}"
echo "blogroots=${blogroots}"
echo "dist=${dist}"

${target}/build.sh

mkdir -p ${blogroots}
rm -rf ${blogroots}/.git

cd ${target}
rm -rf ${dist}
cp -r _site/ ${dist}
cd ${blogroots}

git init
git add .
git commit -m "Initial commit"
git remote add origin ${REMOTE}
git push --force origin master:gh-pages
