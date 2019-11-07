FROM alpine

RUN mkdir -p /usr/src/perl
WORKDIR /usr/src/perl

RUN apk update && apk add gcc g++ make perl perl-dev wget openssl openssl-dev zlib-dev
RUN wget https://raw.githubusercontent.com/miyagawa/cpanminus/master/cpanm \
    && chmod +x cpanm \
    && ./cpanm App::cpanminus \
    && rm -fr ./cpanm /root/.cpanm /usr/src/perl

ENV PERL_CPANM_OPT --verbose --mirror https://cpan.metacpan.org --mirror-only
RUN cpanm strictures Try::Tiny Twitter::API List::Util File::JSON::Slurper Array::Utils && rm -rf ~/.cpanm
ENV PERL_CPANM_OPT $PERL_CPANM_OPT --verify

COPY retTwitterBot /
RUN chmod 755 /retTwitterBot
ENTRYPOINT ["/retTwitterBot"]