FROM alpine

RUN mkdir -p /usr/src/perl
WORKDIR /usr/src/perl

RUN apk update && apk add jq gcc g++ make perl perl-dev wget openssl openssl-dev zlib-dev
RUN wget https://raw.githubusercontent.com/miyagawa/cpanminus/master/cpanm \
    && chmod +x cpanm \
    && ./cpanm App::cpanminus \
    && rm -fr ./cpanm /root/.cpanm /usr/src/perl

ENV PERL_CPANM_OPT --verbose --mirror https://cpan.metacpan.org --mirror-only
RUN cpanm strictures Try::Tiny Twitter::API List::Util File::JSON::Slurper Array::Utils && rm -rf ~/.cpanm
ENV PERL_CPANM_OPT $PERL_CPANM_OPT --verify

COPY TwitterPolite /
COPY Entrypoint /
RUN chmod 755 /TwitterPolite
RUN chmod 755 /Entrypoint
WORKDIR /
ENTRYPOINT ["/Entrypoint"]
