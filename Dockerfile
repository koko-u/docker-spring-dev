FROM gradle:7.4.2-jdk17

# curl
RUN apt update && apt install -y curl

# spring cli
ARG CLI_URL=https://repo.spring.io/release/org/springframework/boot/spring-boot-cli/2.6.7/spring-boot-cli-2.6.7-bin.tar.gz
RUN curl ${CLI_URL} --output /tmp/out.tar.gz
RUN tar xf /tmp/out.tar.gz -C /usr/share

ENV PATH $PATH:/usr/share/spring-2.6.7/bin
WORKDIR /usr/workspace

COPY vscode.extensions .

CMD [ "/bin/bash" ]