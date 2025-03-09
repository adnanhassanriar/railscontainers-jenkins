FROM ruby:3.2

WORKDIR /app

COPY Gemfile Gemfile.lock ./
RUN bundle install && bundle exec rails generate rspec:install
RUN gem install bundler && bundle install
# Copy application files
COPY . .

# Expose the application port
EXPOSE 3000

# Run the Rails server
CMD ["rails", "server", "-b", "0.0.0.0"]