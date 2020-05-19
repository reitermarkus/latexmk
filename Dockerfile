FROM alpine

ENV MANPATH="/usr/local/texlive/texmf-dist/doc/man:${MANPATH}" \
    INFOPATH="/usr/local/texlive/texmf-dist/doc/info:${INFOPATH}" \
    PATH="/usr/local/texlive/bin/x86_64-linuxmusl:${PATH}"

RUN apk add --no-cache \
      perl \
      wget \
 && wget -q http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz \
 && mkdir texlive \
 && tar -xf install-tl-unx.tar.gz -C texlive --strip-components=1 \
 && rm install-tl-unx.tar.gz \
 && cd texlive \
 && { \
      echo 'selected_scheme scheme-full'; \
      echo 'TEXDIR /usr/local/texlive'; \
      echo 'TEXMFLOCAL /usr/local/texlive/texmf-local'; \
      echo 'TEXMFSYSCONFIG /usr/local/texlive/texmf-config'; \
      echo 'TEXMFSYSVAR /usr/local/texlive/texmf-var'; \
      echo 'TEXMFCONFIG ~/.texlive/texmf-config'; \
      echo 'TEXMFVAR ~/.texlive/texmf-var'; \
      echo 'TEXMFHOME ~/texmf'; \
    } > texlive.profile \
 && ./install-tl --profile texlive.profile \
 && cd .. \
 && rm -r texlive \
 && tlmgr update --all --self --reinstall-forcibly-removed \
 && tlmgr backup --all --clean

COPY entry.pl /entry.pl
ENTRYPOINT /entry.pl
