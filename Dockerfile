FROM gcc:4.9

RUN apt-get update && apt-get install -y unzip
RUN wget https://github.com/facebookresearch/fastText/archive/master.zip && \
      unzip master.zip && rm master.zip && mv fastText-master fastText && \
      cd fastText && make

RUN cd fastText && pip install .

ENV PATH /fastText:$PATH

ENTRYPOINT ["fasttext"]