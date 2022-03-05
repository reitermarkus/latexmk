FROM registry.gitlab.com/islandoftex/images/texlive:TL2021-2022-02-06-09-51

RUN tlmgr update --all --self --reinstall-forcibly-removed \
 && tlmgr backup --all --clean

COPY entry.pl /
ENTRYPOINT ["/entry.pl"]
