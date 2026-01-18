FROM debian:trixie-slim AS base
RUN apt-get -y update  && \
    apt-get -y install python3-msgpack python3-pydantic-settings python-is-python3 && \
    apt-get -y autoclean && \
    apt-get -y distclean
FROM base AS dev
ENV LC_ALL=C.UTF-8
RUN apt-get -y update && \
    apt-get -y install ansible-lint datamodel-codegen git python3-datamodel-code-generator
FROM dev AS build
WORKDIR /workspace
COPY . .
RUN ansible-playbook build.yml
FROM base AS prod
WORKDIR /app
COPY --from=build /workspace/build build/
COPY entrypoint.py .
ENTRYPOINT [ "./entrypoint.py" ]
