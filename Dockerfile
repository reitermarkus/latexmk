FROM registry.gitlab.com/islandoftex/images/texlive:TL2021-2022-03-13-04-43

RUN tlmgr update --all --self --reinstall-forcibly-removed \
 && tlmgr backup --all --clean

COPY entry.pl /
ENTRYPOINT ["/entry.pl"]
