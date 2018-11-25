export PATH=$PATH:/home/scientist/.local/bin
Xvfb :1 -screen 0 1024x768x16 &> /tmp/xvfb.log  &
DISPLAY=:1.0
export DISPLAY

$HOME/.local/bin/jupyter lab --allow-root --ip=0.0.0.0