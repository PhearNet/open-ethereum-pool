FROM golang:1.6.2

WORKDIR /home/
COPY . .

RUN apt-get update && \
    apt-get install jq -y && \
    git config --global http.https://gopkg.in.followRedirects true && \
    make && \
    cp ./build/bin/open-ethereum-pool /usr/bin/open-ethereum-pool && \
    cp ./config.json /tmp/config.json && \
    rm -rf /home/* /var/lib/apt/lists/* && \
    cp /tmp/config.json .

ENTRYPOINT "open-ethereum-pool"

EXPOSE 8080

CMD ["config.json"]