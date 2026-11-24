FROM golang:1.27.4@sha256:205c7636d74e0ffbe3d007162df7d74f859f5a8c8322dfb9f907977686c126cf AS go
FROM debian:trixie-slim@sha256:a72b4433de1cf7d6bae0c4cee74d0547f58601a643b3375f070c51600d63b6b2

COPY --from=go /usr/local/go /usr/local/go

# Include the runtime dependencies needed by the IDE backends.
RUN apt-get update && apt-get install -y --no-install-recommends \
    bash ca-certificates curl docker-cli gcc git jq libc6-dev make procps sudo unzip \
    libfreetype6 libstdc++6 libxext6 libxi6 libxrender1 libxtst6 \
    && rm -rf /var/lib/apt/lists/*

RUN groupadd --gid 1000 vscode \
    && useradd --uid 1000 --gid vscode --create-home --shell /bin/bash vscode \
    && echo 'vscode ALL=(root) NOPASSWD:ALL' > /etc/sudoers.d/vscode \
    && chmod 0440 /etc/sudoers.d/vscode

COPY --chmod=0755 setup-docker.sh /usr/local/bin/devcontainer-setup-docker

ENV PATH="/usr/local/go/bin:/home/vscode/go/bin:${PATH}" \
    GOPATH=/home/vscode/go \
    GOMODCACHE=/home/vscode/go/pkg/mod \
    GOCACHE=/home/vscode/.cache/go-build \
    DOCKER_HOST=unix:///var/run/docker.sock

USER vscode
CMD ["sleep", "infinity"]
