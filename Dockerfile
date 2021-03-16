FROM node:12.16.3-buster AS builder

ENV ADBLOCK=true
ENV DISABLE_OPENCOLLECTIVE=true

RUN mkdir -p /var/src

COPY . /var/src/

RUN cd /var/src && npm install --production

FROM node:12.16.3-alpine3.11

COPY --from=builder /var/src /var/app

WORKDIR /var/app
EXPOSE 3000

CMD ["npm", "run", "start"]

