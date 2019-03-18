git checkout dev && \

git pull origin dev && \

sh increment-version.sh && \

sh push-version.sh && \

sh test-and-graduate.sh && \

git checkout master && \

sh inject-version.sh && \

sh build.sh && \

sh nuget-pack.sh && \

git checkout dev && \

sh clean.sh