# Elasticsearch + FluentD(Fluent-Bit) + Kibana

- Fluent-bit is for Internal Server.
- Relay (Fluent-bit) is for External Server.
- FluentD is for Office Server.

## Fluent-bit and FluentD

Example
```sh
$ make -e SSH=sshname rebuild-deploy
```

## Relay
In the case of Office Server, Relay runs as `docker run`.
You should run Makefile in `/relay` folder.

Example
```sh
relay$ make -e SSH=sshname rebuild-deploy
```