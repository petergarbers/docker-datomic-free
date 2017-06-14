FROM clojure

MAINTAINER Peter Garbers "peter@garbers.me"

ENV DATOMIC_VERSION 0.9.5350
ENV DATOMIC_HOME /opt/datomic-free-$DATOMIC_VERSION
ENV DATOMIC_DATA $DATOMIC_HOME/data

ONBUILD RUN wget -O /tmp/datomic.zip https://my.datomic.com/downloads/free/$DATOMIC_VERSION \
  && unzip /tmp/datomic.zip -d /opt \
  && rm -f /tmp/datomic.zip

ONBUILD ADD config $DATOMIC_HOME/config

WORKDIR $DATOMIC_HOME

ENTRYPOINT ["bin/transactor"]

VOLUME $DATOMIC_DATA

EXPOSE 4334 4335 4336
