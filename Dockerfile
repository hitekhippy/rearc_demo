
# This satisfies: Deploy the app in a Docker container. Use node:10 as the base image.
FROM node:10

WORKDIR /app

# Set a default for: Inject an environment variable (SECRET_WORD) in the Docker container. The value of SECRET_WORD should be the secret word discovered on the index page of the application.
ARG SECRET_WORD=${SECRET_WORD:-SUPER_SECRET_STRING}
# Interpolate the value and pass it as an ENV var. 
ENV SECRET_WORD ${SECRET_WORD}

# Copies the packages files to npm install later
COPY package*.json /app/package.json
COPY src/ /app/src/
COPY bin/ /app/bin

RUN npm install

# Expose the app on it's default port
EXPOSE 3000

# Start the app
CMD [ "npm", "start" ]








