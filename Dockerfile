# Use the ruby2.3.1 base image
FROM ruby:2.3.1-slim

# Update everything and install dependencies
RUN apt-get update && apt-get install -y build-essential libpq-dev nodejs

# Create a place for the app to live
RUN mkdir -p /app
WORKDIR /app

# Copy the Gemfile and bundle
COPY Gemfile Gemfile.lock ./
RUN gem install bundler && bundle install --jobs 20 --retry 5

# Copy the rest of the app
COPY . ./

# Expose the Rails dev server port to Docker
# (it's assigned another number outside the image)
EXPOSE 3000

# Prepend all CMDs with `bundle exec`
ENTRYPOINT ["bundle", "exec"]

# Run the server
CMD ["rails", "server", "-b", "0.0.0.0"]