FROM ruby:2.6.3-alpine

RUN mkdir /opt/mobilise-digital
ADD . /opt/mobilise-digital/

# Node JS
RUN apk add --update nodejs nodejs-npm

RUN apk add --update \
  build-base \
  libxml2-dev \
  libxslt-dev \
  postgresql-dev \
  && rm -rf /var/cache/apk/*

WORKDIR "/opt/mobilise-digital"

RUN gem install bundler -v 2.0.2
RUN bundle config build.nokogiri --use-system-libraries
RUN bundle install

CMD ["bundle","exec","rails","s","-p","3000","-b","0.0.0.0"]