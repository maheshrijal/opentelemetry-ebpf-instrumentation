ARG PYTHON_IMAGE=python:3.15.2-slim-bookworm@sha256:96599df822d0e1c6bb700014a05c7f3c8cabc6e0f7ff3c4f9f69cee033b4b5d9
FROM golang:1.27.0@sha256:0ecdc2a9f6156af6451080bfe3d8382a662fcc4e209608c6f919e643453514c1 AS go

FROM ${PYTHON_IMAGE}

COPY --from=go /usr/local/go /usr/local/go
ENV PATH="/opt/exception-python/bin:/usr/local/go/bin:${PATH}" GOTOOLCHAIN=local

ARG PYTHON_VERSION=3.12.13
ARG PYTHON_EXCEPTION_BUILD=shared
COPY internal/test/integration/components/pythonexceptions/build-runtime.sh /tmp/build-runtime.sh
RUN PYTHON_VERSION=${PYTHON_VERSION} PYTHON_EXCEPTION_BUILD=${PYTHON_EXCEPTION_BUILD} sh /tmp/build-runtime.sh

COPY internal/test/integration/components/pythonexceptions/requirements.txt /tmp/requirements.txt
RUN python3 -m pip install --no-cache-dir --require-hashes -r /tmp/requirements.txt
WORKDIR /src
