#Task-2 ci-cd-jenkins

# ----------- Build Stage -----------
FROM node:slim AS build


RUN apt-get update && apt-get install -y git 

WORKDIR /usr/src/app

# Clone the private repo using forwarded SSH key


RUN  git clone https://github.com/Elevate-labs-intership/Task-2-CI-CD-JENKINS.git


# Install dependencies and build the project
WORKDIR /usr/src/app/Task-2-CI-CD-JENKINS
RUN npm install --legacy-peer-deps && npm run build


# ----------- Runtime Stage -----------
FROM node:slim

WORKDIR /usr/src/app/

# Copy built project from previous stage
COPY --from=build /usr/src/app/Task-2-CI-CD-JENKINS ./

# Start the app
CMD ["npm", "run","start"]