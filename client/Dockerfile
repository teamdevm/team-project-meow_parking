FROM node:18.16-slim  

WORKDIR /app  

COPY . .  

RUN npm install 
RUN npm  install --prefix ./interface/ 
RUN npm run build --prefix ./interface/   
RUN npm install react --prefix ./interface/  

ENV NODE_ENV production  

EXPOSE 3000  

CMD ["npm", "start", "--prefix", "./interface"]
