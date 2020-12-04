FROM ruby:2.5

RUN apt-get update -qq && apt-get install -y nodejs

WORKDIR /todolists

COPY Gemfile Gemfile.lock ./

RUN bundle install

COPY . .

EXPOSE 3000

CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]
