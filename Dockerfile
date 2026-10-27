# Thin wrapper over the official New API image.
# Only purpose: make the container SSH-able on Render (unlocked account + 0700 ~/.ssh).
FROM calciumion/new-api:latest

RUN apt-get update \
    && apt-get install -y --no-install-recommends openssh-client less nano procps curl \
    && rm -rf /var/lib/apt/lists/* \
    && echo "root:$(head -c 32 /dev/urandom | base64)" | chpasswd \
    && mkdir -p /root/.ssh \
    && chmod 700 /root/.ssh
