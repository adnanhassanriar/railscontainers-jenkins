FROM ruby:3.2

WORKDIR /app

# Install dependencies
COPY Gemfile Gemfile.lock ./
RUN bundle install

# Generate RSpec configuration
RUN bundle exec rails generate rspec:install

# Copy application code
COPY . .

EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]