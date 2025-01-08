FROM registry.rcp.epfl.ch/imaging-server-kit/imaging-server-kit:3.9

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update -y \
    && apt upgrade -y \
    && apt-get install -yq --no-install-recommends \
    python3-dev \
    python3-venv \
    gcc \
    g++ \
    && apt-get autoremove --purge \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /tmp/* \
    && find /var/log -type f -exec cp /dev/null \{\} \;

COPY . .

RUN python -m pip install -r requirements.txt
