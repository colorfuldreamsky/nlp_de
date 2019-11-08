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
  numpy \
  requests \
  sklearn_crfsuite \
  spacy\
  requests \
  pandas \
  sklearn \
  rasa \
  tensorflow \
  keras \
  flask \
  prompt-toolkit==1.0.15 

RUN pip3 install rasa-x -i https://pypi.rasa.com/simple

EXPOSE 8888
EXPOSE 9000
EXPOSE 5000

RUN python3 -m spacy download en
RUN useradd -ms /bin/bash codete
RUN adduser codete sudo

USER codete
WORKDIR /home/codete/
RUN mkdir /home/codete/workshop/
CMD jupyter-notebook --ip=0.0.0.0 --NotebookApp.token='' --NotebookApp.password='' --no-browser --notebook-dir=/home/codete/workshop/
