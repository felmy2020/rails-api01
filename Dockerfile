FROM ruby:2.7.5

ENV RAILS_ENV=production

RUN apt-get update -qq && \
  apt-get install -y build-essential \
  libpq-dev \
  nodejs \
  mariadb-client \
  vim \
  && rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY ./api /app
RUN bundle config --local set path 'vendor/bundle' \
  && bundle install

COPY start.sh /start.sh
RUN chmod 744 /start.sh
CMD ["sh", "/start.sh"]
