docker build -t nodejs:custom \
       --build-arg USER_ID=$(id -u) \
       --build-arg USER_NAME=$(id -un) \
       --build-arg GROUP_ID=$(id -g) .
