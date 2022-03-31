FROM node:14-stretch-slim

# dependencies for vscode-test
RUN apt-get update && apt-get install -y \
wget \
unzip \
zip \
git \
libpangocairo-1.0-0 \
libx11-xcb1 \
libxcomposite1 \
libxcursor1 \
libxdamage1 \
libxi6 \
libxtst6 \
libnss3 \
libcups2 \
libxss1 \
libxrandr2 \
libgconf2-4 \
libasound2 \
libatk1.0-0 \ 
libgtk-3-0 \
libsecret-1.0 \
curl \
bzip2 \
xz-utils \
apt-transport-https \
dirmngr \
ca-certificates \
gnupg2 \
software-properties-common \
sudo \
xvfb

# install java (jre only)
RUN apt-get update && apt-get install -y default-jre
