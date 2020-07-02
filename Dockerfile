FROM ruby:2.5.3

RUN apt-get update -qq && \
    apt-get install -y build-essential \ 
                       libpq-dev \        
                       nodejs \
                       mysql-client

RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - \
    && apt-get install -y nodejs          

RUN mkdir /app_name 
ENV APP_ROOT /app_name 
WORKDIR $APP_ROOT

ADD ./Gemfile $APP_ROOT/Gemfile
ADD ./Gemfile.lock $APP_ROOT/Gemfile.lock
ADD ./start.sh $APP_ROOT/bin/start.sh
RUN chmod +x $APP_ROOT/bin/start.sh

RUN bundle install
ADD . $APP_ROOT

EXPOSE 3000
CMD ["bin/start.sh"]
