FROM ruby:3.2

WORKDIR /app

# Install dependencies
COPY Gemfile Gemfile.lock ./
RUN bundle install

# Copy the full application code
COPY . .

# Generate RSpec configuration (after copying the app)
RUN bundle exec rails generate rspec:install

EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]