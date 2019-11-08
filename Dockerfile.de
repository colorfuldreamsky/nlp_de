FROM ubuntu:18.04

ENV TZ=Europe/Warsaw
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone 

RUN apt update && apt install -y \
  jupyter-core \
  openjdk-8-jdk \
  jupyter-notebook \
  python3-pip \
  wget \
  vim \
  git


RUN pip3 install \
  seaborn \
  scipy \
  numpy \
  requests \
  rasa_nlu \
  sklearn_crfsuite \
  slackclient \
  spacy\
  gtts\
  pysqlite3 \
  matplotlib \
  jellyfish \
  requests \
  pandas \
  sklearn \
  cherrypy\
  pydub\
  six \
  py4j \
  nltk \
  rasa_core \
  gensim \
  slackclient \
  tensorflow==1.11.0 \
  tensorlayer \
  keras \
  textblob \
  stanfordcorenlp \
  dill \
  ftfy \
  scipy \
  slackeventsapi \
  pymessenger \
  flask \
  tensorboard==1.11.0 \
  jupyter-tensorboard \
  webexteamssdk \
  language_check \
  atdtool \
  stanfordcorenlp \
  ruler \
  pytypo \
  pyspellchecker

EXPOSE 8888
EXPOSE 9000
EXPOSE 5000
EXPOSE 5050
EXPOSE 6006

RUN jupyter-tensorboard enable --system
RUN python3 -m spacy download en
RUN python3 -m spacy download en_core_web_lg
RUN python3 -m spacy download de
RUN useradd -ms /bin/bash codete
RUN adduser codete sudo

USER codete
WORKDIR /home/codete/
RUN mkdir /home/codete/workshop/
RUN mkdir /home/codete/workshop/tensorboard/
RUN mkdir /home/codete/workshop/tensorboard/logs/
RUN python3 -m nltk.downloader all
RUN tensorboard --logdir /home/codete/workshop/tensorboard/logs/ &
CMD jupyter-notebook --ip=0.0.0.0 --NotebookApp.token='' --NotebookApp.password='' --no-browser --notebook-dir=/home/codete/workshop/
