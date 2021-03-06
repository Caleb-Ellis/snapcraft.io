FROM ubuntu:bionic

# System dependencies
RUN apt-get update && apt-get install --yes python3-pip libsodium-dev

# Python dependencies
ENV LANG C.UTF-8

# Import code, install code dependencies
WORKDIR /srv
ADD . .
RUN pip3 install -r requirements.txt

# Set git commit ID
ARG COMMIT_ID
RUN test -n "${COMMIT_ID}"
RUN echo "${COMMIT_ID}" > version-info.txt
ENV COMMIT_ID "${COMMIT_ID}"

# Set which webapp configuration to load
ARG WEBAPP
RUN test -n "${WEBAPP}"
ENV WEBAPP "${WEBAPP}"

# Setup commands to run server
ENTRYPOINT ["./entrypoint"]
CMD ["0.0.0.0:80"]

