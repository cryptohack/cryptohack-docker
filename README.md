# CryptoHack Docker Container

A Jupyter notebook environment built for attacking crypto challenges, with custom theming matching [CryptoHack](https://cryptohack.org).

It comes with the following installed and integrated:
 - Sage 9 (based on Python3)
 - Pwntools
 - PyCryptodome
 - z3 Prover

## Installation

Download and run with:
```
docker run -p 127.0.0.1:8888:8888 -it hyperreality/cryptohack:latest
```
Then open 127.0.0.1:8888 in your browser.

## Notes

We map to 127.0.0.1 on the host rather than the default 0.0.0.0 as Jupyter token authentication was disabled for the sake of convenience.