FROM dart:3.3.0-sdk

ARG FLUTTER_VERSION
ENV PATH="$PATH:/root/.pub-cache/bin"
RUN apt-get update; \
    apt-get install -y --no-install-recommends \
        clang \
        cmake \
        libgtk-3-dev \
        ninja-build \
        pkg-config \
    ; \
    rm -rf /var/lib/apt/lists/*
RUN dart pub global activate melos \ 
 && dart pub global activate fvm \
 && fvm doctor --verbose \
 && fvm releases \
 && fvm install --setup $FLUTTER_VERSION
