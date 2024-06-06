FROM rocker/tidyverse:4.3.3

WORKDIR /home/rosace

RUN mkdir data

RUN install2.r --error \
    --repos https://mc-stan.org/r-packages --repos getOption \
    cmdstanr \
    && rm -rf /tmp/downloaded_packages

RUN R -e "library(cmdstanr); install_cmdstan(cores = 4)"

# Install the release version of rosace (tag ff8811249673ded685ae03b3a03cb4157261bf25)
RUN installGithub.r --deps TRUE \
    pimentellab/rosace@ff8811249673ded685ae03b3a03cb4157261bf25 \
    && rm -rf /tmp/downloaded_packages
