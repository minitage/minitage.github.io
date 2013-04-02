#!/usr/bin/env bash
rm -rf ../sources                           \
    ../a                                       \
    ../about.html                              \
    ../develop.html                            \
    ../doctrees                                \
    ../genindex.html                           \
    ../index.html                              \
    ../installation.html                       \
    ../installation_new.html                   \
    ../installation_old.html                   \
    ../installation_prerequisite.html          \
    ../json                                    \
    ../latex                                   \
    ../minitage_fr_pres.html                   \
    ../objects.inv                             \
    ../paster                                  \
    ../qthelp                                  \
    ../search.html                             \
    ../searchindex.js                          \
    ../sources                                 \
    ../spec.html                               \
    ../static                                  \
    ../text                                    \
    ../usage.html                              \
    ../usecases                                \
    ../why.html                                \
                                        

make html
git add ..
git commit -am up
# vim:set et sts=4 ts=4 tw=80:
