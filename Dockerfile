FROM haskell:8.6.3

RUN set -eux; \
  stack setup --resolver lts-13.16 && \
  echo ":q" | stack ghci

RUN rm -rf /opt/ghc /opt/cabal

CMD ["stack","ghci"]
