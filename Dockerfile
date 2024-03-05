FROM rocker/tidyverse:4.3.2

WORKDIR /home/rosace

RUN install2.r --error \
    --repos https://mc-stan.org/r-packages --repos getOption \
    cmdstanr \
    && rm -rf /tmp/downloaded_packages

RUN R -e "library(cmdstanr); install_cmdstan(cores = 4)"

RUN install2.r --error \
    devtools \
    && rm -rf /tmp/downloaded_packages

RUN R -e "library(cmdstanr); install_cmdstan(cores = 4)"

RUN installGithub.r --deps TRUE \
    pimentellab/rosace@0d469506a02057f6402d6a0b9d075cd5eaa1a177 \
    && rm -rf /tmp/downloaded_packages