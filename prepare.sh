echo "Preparing for duinocom.core project"
echo "Dir: $PWD"

DIR=$PWD

if ! type "mono" > /dev/null; then
  sudo apt-get update && sudo apt-get install -y mono-complete
fi
