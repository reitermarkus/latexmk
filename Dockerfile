FROM registry.gitlab.com/islandoftex/images/texlive:TL2022-2022-05-01-08-46

RUN tlmgr update --all --self --reinstall-forcibly-removed \
 && tlmgr backup --all --clean

COPY entry.pl /
ENTRYPOINT ["/entry.pl"]
