FROM swift:5.4-xenial

RUN apt-get update
RUN apt-get -y install libxml2-dev curl gnupg
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash -
RUN apt-get -y install nodejs
RUN npm i -g --unsafe-perm=true netlify-cli
