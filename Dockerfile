FROM node:12-stretch-slim

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
RUN mkdir ./usr/share/man/man1
RUN apt-get update && apt-get install -y default-jre

# install chrome
RUN wget -q https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb && \
    dpkg -x google-chrome-stable_current_amd64.deb /opt && \
    ln -fs /opt/opt/google/chrome/google-chrome /usr/bin/google-chrome && \
    rm google-chrome-stable_current_amd64.deb

# install chrome driver
# last stable release
ENV CHROMEDRIVER_VERSION 88.0.4324.96
RUN wget -q https://chromedriver.storage.googleapis.com/$CHROMEDRIVER_VERSION/chromedriver_linux64.zip && \
  unzip chromedriver_linux64.zip -d /opt && \
  ln -fs /opt/chromedriver /usr/bin/chromedriver && \
  rm chromedriver_linux64.zip

# add chrome driver and chrome into path
ENV PATH="/usr/bin/chromedriver:$PATH"
ENV PATH="/usr/bin/google-chrome:$PATH"

# add vscode packaging tool
RUN yarn global add vsce

# add docker cli into container
RUN curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add - \
    && add-apt-repository \
        "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable" \
    && apt-get update && apt-get install -y --no-install-recommends docker-ce-cli