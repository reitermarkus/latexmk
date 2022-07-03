FROM registry.gitlab.com/islandoftex/images/texlive:TL2022-2022-07-03-08-26

RUN tlmgr update --all --self --reinstall-forcibly-removed \
 && tlmgr backup --all --clean

COPY entry.pl /
ENTRYPOINT ["/entry.pl"]
