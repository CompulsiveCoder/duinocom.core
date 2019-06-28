echo "Packaging release zip file..."

. ./project.settings

DIR=$PWD

TMP_RELEASE_FOLDER=".tmp/$PROJECT_NAME/lib/net40/"
BIN_RELEASE_FOLDER="bin/Release"
RELEASES_FOLDER="releases"

BRANCH=$(git branch | sed -n -e 's/^\* \(.*\)/\1/p')

VERSION_POSTFIX=""

if [ "$BRANCH" != "lts" ]; then
  VERSION_POSTFIX="-$BRANCH"
fi

VERSION="$(cat version.txt).$(cat buildnumber.txt)"

mkdir -p $TMP_RELEASE_FOLDER

cp $BIN_RELEASE_FOLDER/duinocom.core.dll $TMP_RELEASE_FOLDER/
cp $BIN_RELEASE_FOLDER/duinocom.core.dll.mdb $TMP_RELEASE_FOLDER/

mkdir -p $RELEASES_FOLDER

cd .tmp/$PROJECT_NAME

zip -r $DIR/releases/$PROJECT_NAME.$VERSION$VERSION_POSTFIX.zip *

cd $DIR

rm .tmp -r

echo "Finished packaging release zip file."
