# jupyter-gwyddion
Create a docker image to run a jupyter notebook with gwyddion install and other usefull packages

## Run
```
docker run -ti -p 8888:8888 \
   -e JUPYTER_ENABLE_LAB=yes \
   -v /path/with/data:/home/scientist/workspace/notebooks/data \
   -v /path/with/notebooks:/home/scientist/workspace/notebooks \
    asastrebruno/jupyter-gwyddion
```