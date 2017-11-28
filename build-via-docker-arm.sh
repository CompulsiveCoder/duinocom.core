
docker run -i -v /var/run/docker.sock:/var/run/docker.sock -v $PWD:/duinocom.core compulsivecoder/ubuntu-arm-mono /bin/bash -c "cd /duinocom.core && sh prepare.sh && sh init.sh && sh build.sh"
