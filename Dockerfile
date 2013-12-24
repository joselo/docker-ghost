# Install Ghost blogging platform and run developer environment
#
# VERSION 0.0.1

FROM saltstack/ubuntu-13.04
MAINTAINER Jose Carrion "joseloc@gmail.com"

WORKDIR /data/ghost
#ENV NODE_ENV production

# Install dependencies for nginx installation
#RUN apt-get install -y python g++ make software-properties-common
RUN apt-get install -y python-software-properties python g++ make
RUN add-apt-repository -y ppa:chris-lea/node.js
RUN apt-get update

# Install nodejs & npm
RUN apt-get install -y rlwrap
RUN apt-get install -y nodejs 
RUN curl https://npmjs.org/install.sh | sh

# Install other packages
RUN apt-get install -y unzip
RUN apt-get install -y wget

# Download Ghost
RUN wget -c https://ghost.org/zip/ghost-0.3.3.zip

# Unzip Ghost zip to /data/ghost
RUN unzip -uo ghost-0.3.3.zip -d /data/ghost

# Add custom config js to /data/ghost
ADD ./config.example.js /data/ghost/config.js

# Install Ghost with NPM
RUN cd /data/ghost/ && npm install --production

# Install Ghost themes from (Optional)
RUN wget -c https://github.com/viktorbezdek/ghostentista/archive/master.zip -O ghostentista.zip
RUN unzip -uo ghostentista.zip -d /data/ghost/content/themes

RUN wget -c https://github.com/sethlilly/Vapor/archive/master.zip -O Vapor.zip
RUN unzip -uo Vapor.zip -d /data/ghost/content/themes

# Expose port 2368
EXPOSE 2368

# Run Ghost
CMD ["npm","start"]
