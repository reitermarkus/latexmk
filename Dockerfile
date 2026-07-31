FROM registry.gitlab.com/islandoftex/images/texlive:TL2022-2022-07-03-08-26@sha256:2bcf08c91d7c440a77bd9834e1b0a7a6aa07c20842b415c10b7fda6c5dca1820

RUN tlmgr update --all --self --reinstall-forcibly-removed \
 && tlmgr backup --all --clean

COPY entry.pl /
ENTRYPOINT ["/entry.pl"]
