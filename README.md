# ffox-old:51-jre-1.8

## Build

    docker build -t mdye/ffox-old:51-jre-1.8 .

## Run
    docker run --rm --env="DISPLAY" --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" -it mdye/ffox-old:51-jre-1.8
