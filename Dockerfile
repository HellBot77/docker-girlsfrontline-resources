FROM alpine/git AS base

ARG TAG=latest
RUN git clone https://github.com/36base/girlsfrontline-resources.git && \
    cd girlsfrontline-resources && \
    ([[ "$TAG" = "latest" ]] || git checkout ${TAG}) && \
    rm -rf .git

FROM joseluisq/static-web-server

COPY --from=base /git/girlsfrontline-resources ./public
