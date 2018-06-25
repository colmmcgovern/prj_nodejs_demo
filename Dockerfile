FROM node:argon-slim



#RUN useradd -c 'Node.js user' -m -d /home/node -s /bin/bash node
#USER node

#create app directory
WORKDIR /usr/src/app

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json ./

RUN npm install -g n
RUN n latest
# If you are building your code for production
# RUN npm install --only=production


EXPOSE 1337

RUN npm -g install sails
RUN mkdir colmtest

# Bundle app source
COPY . .

#CMD [ "/bin/bash" ]
#RUN cd colmtest
#CMD ["cd","colmtest"]
CMD [ "sails", "lift" ]