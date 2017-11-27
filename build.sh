echo "Starting build for duinocom.core project"
echo "Dir: $PWD"

MODE=$1

if [ -z "$MODE" ]; then
    MODE="Release"
fi

echo "Mode: $MODE"

msbuild src/duinocom.core.sln /p:Configuration=$MODE
