VERSION_ARGUMENT=$1

if [ ! $VERSION_ARGUMENT ]; then
  VERSION=$(cat version.txt)
  BUILD=$(cat buildnumber.txt)

  FULL_VERSION="$VERSION.$BUILD"
else
  FULL_VERSION=$VERSION_ARGUMENT
fi

echo "Injecting version into AssemblyInfo.cs file..."
echo "  Version: $FULL_VERSION"

sed -i -e "s/1\.0\.0\.[.0-9]*/$FULL_VERSION/g" "src/duinocom.core/Properties/AssemblyInfo.cs"

echo "Finished injecting version"
