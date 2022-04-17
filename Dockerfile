FROM registry.gitlab.com/islandoftex/images/texlive:TL2022-2022-04-17-04-05

RUN tlmgr update --all --self --reinstall-forcibly-removed \
 && tlmgr backup --all --clean

COPY entry.pl /
ENTRYPOINT ["/entry.pl"]
