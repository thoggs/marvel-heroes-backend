# Use Oracle Linux 9 as the base image for building the JDK
FROM oraclelinux:9 as builder

# Install necessary tools
RUN set -eux; \
    dnf install -y tar; \
    dnf clean all

# Default to UTF-8 file.encoding
ENV LANG=pt_BR.UTF-8

# Environment variables for the builder image.
ENV JAVA_URL=https://download.oracle.com/java/21/latest \
    JAVA_HOME=/usr/java/jdk-21

SHELL ["/bin/bash", "-o", "pipefail", "-c"]
RUN set -eux; \
    ARCH="$(uname -m)" && \
    if [ "$ARCH" = "x86_64" ]; then ARCH="x64"; fi && \
    JAVA_PKG="$JAVA_URL/jdk-21_linux-${ARCH}_bin.tar.gz"; \
    JAVA_SHA256=$(curl -sSL "$JAVA_PKG.sha256"); \
    curl -o /tmp/jdk.tgz -sSL "$JAVA_PKG"; \
    echo "$JAVA_SHA256 */tmp/jdk.tgz" | sha256sum -c -; \
    mkdir -p "$JAVA_HOME"; \
    tar --extract --file /tmp/jdk.tgz --directory "$JAVA_HOME" --strip-components 1; \
    rm /tmp/jdk.tgz

# Use a fresh Oracle Linux 9 image for the final runtime image
FROM oraclelinux:9

# Default to UTF-8 file.encoding
ENV LANG=pt_BR.UTF-8
ENV JAVA_HOME=/usr/java/jdk-21
ENV PATH=$JAVA_HOME/bin:$PATH

# Copy the uncompressed Java Runtime from the builder image
COPY --from=builder $JAVA_HOME $JAVA_HOME

RUN set -eux; \
    dnf -y update; \
    dnf install -y freetype fontconfig glibc-langpack-pt glibc-locale-source; \
    dnf clean all; \
    localedef -i pt_BR -f UTF-8 pt_BR.UTF-8; \
    ln -sfT "$JAVA_HOME" /usr/java/default; \
    ln -sfT "$JAVA_HOME" /usr/java/latest; \
    for bin in "$JAVA_HOME/bin/"*; do \
        base="$(basename "$bin")"; \
        [ ! -e "/usr/bin/$base" ]; \
        alternatives --install "/usr/bin/$base" "$base" "$bin" 20000; \
    done

# Set the working directory
WORKDIR /app

# Copy the Spring Boot application JAR file
ARG JAR_FILE=build/libs/*.jar
COPY ${JAR_FILE} app.jar

# Expose the default port for Spring Boot
EXPOSE 8080

# Run the Spring Boot application
ENTRYPOINT ["java", "-jar", "app.jar"]
