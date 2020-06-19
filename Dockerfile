FROM python:3.7
LABEL maintainer="am0089@uah.edu" \
     author="Abdelhak Marouane"
# Never prompts the user for choices on installation/configuration of packages
ENV DEBIAN_FRONTEND noninteractive
ENV TERM linux

RUN apt-get -y update && \
    pip install twine && \
    apt-get install -y libxml2-utils && \
    apt-get install -y zip rsync && \
    apt-get install -y python3-setuptools && \
    apt-get install -y python3-dev &&\
    apt-get install -y nano

RUN pip install pytest && \
    pip install awscli --upgrade

RUN useradd -u 500 -ms /bin/bash bamboo 
RUN mkdir /build
COPY requirements.sh /build/

RUN bash /build/requirements.sh

# Adding bamboo user
USER bamboo 
ENV HOME=/home/bamboo
WORKDIR $HOME/workstation

# Install pyARt dependecies for MDX
RUN pip install numpy==1.16.0 && \
    pip install arm-pyart==1.11.1

# Adding dummy build.sh that needs to be overreten 
COPY entrypoint.sh $HOME/entrypoint.sh 
ENTRYPOINT [ "/bin/bash", "/home/bamboo/entrypoint.sh"]
#CMD [ "/bin/bash", "/home/bamboo/entrypoint.sh"]
