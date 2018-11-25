FROM ubuntu:18.04

RUN apt-get update && \
    apt-get install -y \
      gwyddion \
      python2.7 \
      python-dev \
      python-pip \
      xvfb \
      python-gtk2-dev \
      openjdk-8-jdk

RUN useradd -m -r scientist

USER scientist

ENV HOME /home/scientist

ENV PATH $PATH:/home/scientist/.local/bin

RUN pip install --user --upgrade pip

RUN $HOME/.local/bin/pip install --user jupyterlab

RUN $HOME/.local/bin/pip install --user scipy

RUN $HOME/.local/bin/pip install --user scikit-learn

RUN $HOME/.local/bin/pip install --user pyspark

RUN $HOME/.local/bin/pip install --user tensorflow

RUN $HOME/.local/bin/pip install --user pandas matplotlib==2.0.1

ADD ./start.sh $HOME/start.sh

USER root

RUN chown scientist $HOME/start.sh

USER scientist

RUN chmod u+x $HOME/start.sh

RUN mkdir $HOME/workspace

WORKDIR $HOME/workspace

ENTRYPOINT $HOME/start.sh