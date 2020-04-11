FROM sagemath/sagemath:latest

USER root

RUN apt-get -qq update \
    && apt-get -qq install -y --no-install-recommends \
    netcat \
    tmux \
    vim \
    && rm -rf /var/lib/apt/lists/*

USER sage

RUN /home/sage/sage/local/bin/pip install --no-cache-dir \
    pwntools \
    pyCryptoDome \
    z3-solver

COPY --chown=sage:sage cryptohack_example.ipynb .
COPY --chown=sage:sage z3_example.ipynb .
COPY --chown=sage:sage custom.css /home/sage/.sage/jupyter-4.1/custom/custom.css

ENV PWNLIB_NOTERM=true

ENV BLUE='\033[0;34m'
ENV YELLOW='\033[1;33m'
ENV RED='\e[91m'
ENV NOCOLOR='\033[0m'

ENV BANNER=" \n\
${BLUE}----------------------------------${NOCOLOR} \n\
${YELLOW}CryptoHack Docker Container${NOCOLOR} \n\
\n\
${RED}After Jupyter starts, visit http://127.0.0.1:8888${NOCOLOR} \n\
${BLUE}----------------------------------${NOCOLOR} \n\
"

CMD ["echo -e $BANNER && sage -n jupyter --NotebookApp.token='' --no-browser --ip='0.0.0.0' --port=8888"]

