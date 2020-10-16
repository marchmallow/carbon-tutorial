FROM node:14

WORKDIR /home/node
RUN apt update \
  && apt install -y git yarn vim  

RUN git clone https://github.com/carbon-design-system/carbon-tutorial.git \
  && ls -l  ./carbon-tutorial

WORKDIR /home/node/carbon-tutorial

RUN rm -fr node_modules \
  && rm yarn.lock \	
  && yarn \
  && yarn build \
  && yarn global add serve

EXPOSE 5000

CMD serve -s build
