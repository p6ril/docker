WORKING_DIR=$(pwd .)
docker container run -it --rm \
                     -v ${WORKING_DIR}:/home/$(id -un)/dev \
                     -p 3001:3001 \
                     nodejs:custom
