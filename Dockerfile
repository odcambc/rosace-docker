FROM rocker/tidyverse:4.3.2

WORKDIR /home/rosace

RUN mkdir data

RUN install2.r --error \
    --repos https://mc-stan.org/r-packages --repos getOption \
    cmdstanr \
    && rm -rf /tmp/downloaded_packages

RUN R -e "library(cmdstanr); install_cmdstan(cores = 4)"

# Install the release version of rosace (tag 0d469506a02057f6402d6a0b9d075cd5eaa1a177)
RUN installGithub.r --deps TRUE \
    pimentellab/rosace@0d469506a02057f6402d6a0b9d075cd5eaa1a177 \
    && rm -rf /tmp/downloaded_packages
