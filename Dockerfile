FROM rocker/tidyverse:4.3.3

WORKDIR /home/rosace

RUN mkdir data

RUN install2.r --error \
    --repos https://mc-stan.org/r-packages --repos getOption \
    cmdstanr \
    && rm -rf /tmp/downloaded_packages

RUN R -e "library(cmdstanr); install_cmdstan(cores = 4)"

# Install the release version of rosace (tag a6a95a671818f05ff3a2c0fea800fe370bdae565)
RUN installGithub.r --deps TRUE \
    pimentellab/rosace@a6a95a671818f05ff3a2c0fea800fe370bdae565 \
    && rm -rf /tmp/downloaded_packages
