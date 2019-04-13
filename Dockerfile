FROM haskell:8.6.3

ENV RESOLVER_VERSION=lts-13.16

RUN set -eux; \
  stack setup --resolver ${RESOLVER_VERSION} && \
  echo ":q" | stack ghci

RUN rm -rf /opt/ghc /opt/cabal

CMD ["stack","ghci"]
