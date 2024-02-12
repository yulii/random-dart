FROM dart:3.2.6-sdk

ARG FLUTTER_VERSION
ENV PATH="$PATH:/root/.pub-cache/bin"
RUN dart pub global activate melos \ 
 && dart pub global activate fvm \
 && fvm doctor --verbose \
 && fvm releases \
 && fvm install --setup $FLUTTER_VERSION
