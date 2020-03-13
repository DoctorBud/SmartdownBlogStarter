export here=${0%/*}
REMOTE=`git remote get-url --push origin`

# ${here}/build.sh cb
# ${here}/build.sh legacy
# ${here}/build.sh mm

blogRoots="/tmp/blogRoots"

rm -rf ${blogRoots}
mkdir -p ${blogRoots}

cp -r ${here}/cb/_site/ ${blogRoots}/cb
cp -r ${here}/legacy/_site/ ${blogRoots}/legacy
cp -r ${here}/mm/_site/ ${blogRoots}/mm

cd ${blogRoots}

git init
git add .
git commit -m "Initial commit"
git remote add origin ${REMOTE}
git push --force origin master:gh-pages
