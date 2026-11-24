# This is a renovate-friendly source of Docker images.
FROM busybox:musl@sha256:80e38f9a1b39188b8bdb28879178edb322a4402b081a9aedda1924609decd6f6 AS busybox-musl
FROM davidanson/markdownlint-cli2:v0.24.2@sha256:c768e94d8bb161c449bde28f60656929ca1f02c3010a405f65c9cac71563a889 AS markdown
FROM gradle:9.9.2-jdk21-noble@sha256:d9c7316e6621db0496e598b6c66064475dacfb2cc21f690bcd9469241f8db4ef AS gradle-java
FROM ghcr.io/astral-sh/uv:python3.9-trixie-slim@sha256:8f0d49ccab34876916fe67c6190fdf14c31cf64153dc08b73664162342f50feb AS python39
FROM ghcr.io/astral-sh/uv:python3.14-trixie-slim@sha256:da0f1f04404173d7d2fa158112e09624d5a80262efa86c89882b68389dfd44eb AS python314
FROM golang:1.27.4@sha256:205c7636d74e0ffbe3d007162df7d74f859f5a8c8322dfb9f907977686c126cf AS golang
FROM otel/weaver:v0.28.0@sha256:5857bb81d8cc7ed608cdcae37c4b459eb020f21dd4acade35f7933cd6762fbcc AS weaver
