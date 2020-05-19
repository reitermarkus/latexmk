FROM alpine

ENV PATH="/usr/local/texlive/bin/x86_64-linuxmusl:${PATH}"

RUN apk add --no-cache \
      perl \
 && apk add --update-cache --virtual install-dependencies  \
      wget \
 && wget -q http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz \
 && mkdir texlive \
 && tar -xf install-tl-unx.tar.gz -C texlive --strip-components=1 \
 && rm install-tl-unx.tar.gz \
 && cd texlive \
 && { \
      echo 'selected_scheme scheme-full'; \
      echo 'TEXDIR /usr/local/texlive'; \
      echo 'TEXMFCONFIG ~/.texlive/texmf-config'; \
      echo 'TEXMFHOME ~/texmf'; \
      echo 'TEXMFLOCAL /usr/local/texlive/texmf-local'; \
      echo 'TEXMFSYSCONFIG /usr/local/texlive/texmf-config'; \
      echo 'TEXMFSYSVAR /usr/local/texlive/texmf-var'; \
      echo 'TEXMFVAR ~/.texlive/texmf-var'; \
    } > texlive.profile \
 && ./install-tl --profile texlive.profile \
 && apk del install-dependencies \
 && cd .. \
 && rm -r texlive \
 && tlmgr update --all --self --reinstall-forcibly-removed

COPY entry.pl /entry.pl
ENTRYPOINT /entry.pl
