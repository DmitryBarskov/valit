FROM ruby:3.1.1-slim-bullseye

ARG RAILS_ROOT=/valit
ARG PACKAGES="git build-essential libpq-dev"

RUN apt update \
  && apt install -y $PACKAGES \
  && apt clean \
  && rm -rf /var/lib/apt/lists

RUN mkdir $RAILS_ROOT
WORKDIR $RAILS_ROOT

COPY Gemfile Gemfile.lock ./
RUN bundle install --jobs 5

ADD . $RAILS_ROOT
ENV PATH=$RAILS_ROOT/bin:${PATH}

EXPOSE 3000
CMD bundle exec rails s -b '0.0.0.0' -p 3000
