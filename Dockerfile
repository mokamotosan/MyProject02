# From: https://www.cloudnotes.tech/entry/docker-nlp-env
FROM jupyter/datascience-notebook
USER root

# Update
RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get -y dist-upgrade

# MeCab + mecab-ipadic-NEologd (/usr/lib/x86_64-linux-gnu/mecab/dic/mecab-ipadic-neologd)
RUN apt-get install -y mecab libmecab-dev mecab-ipadic mecab-ipadic-utf8 file
RUN git clone --depth 1 https://github.com/neologd/mecab-ipadic-neologd.git
RUN mecab-ipadic-neologd/bin/install-mecab-ipadic-neologd -n -y
RUN pip install mecab-python3 ipykernel
RUN cp /etc/mecabrc /usr/local/etc/

# Word2vec(gensim)
RUN pip install gensim #latest
# RUN pip install gensim==3.8.3

# japanize-matplotlib
RUN pip install japanize-matplotlib