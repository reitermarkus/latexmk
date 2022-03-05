FROM registry.gitlab.com/islandoftex/images/texlive:TL2021-2021-12-26-04-05

RUN tlmgr update --all --self --reinstall-forcibly-removed \
 && tlmgr backup --all --clean

COPY entry.pl /
ENTRYPOINT ["/entry.pl"]
