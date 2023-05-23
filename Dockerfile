FROM swift:5.8-jammy

RUN apt-get update
RUN apt-get -y install libxml2-dev curl gnupg
RUN curl -sL https://deb.nodesource.com/setup_16.x | bash -
RUN apt-get -y install nodejs
RUN npm i -g --unsafe-perm=true netlify-cli
