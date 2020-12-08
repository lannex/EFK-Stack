FROM fluent/fluentd:v1.11-1

USER root

RUN apk add --no-cache --update --virtual .build-deps \
  sudo build-base ruby-dev \
  && sudo gem install \
    # fluent-plugin-concat \
    fluent-plugin-elasticsearch \
    # fluent-plugin-rewrite-tag-filter \
    # fluent-plugin-detect-exceptions \
    # fluent-plugin-multi-format-parser \
    # fluent-plugin-forest \
    # fluent-plugin-record-reformer \
    # fluent-plugin-docker_metadata_elastic_filter \
    # fluent-plugin-filter_typecast \
    # fluent-plugin-filter_empty_keys \
  && apk del .build-deps \
  && rm -rf /tmp/* /var/tmp/* /usr/lib/ruby/gems/*/cache/*.gem

COPY conf/* /fluentd/etc/
COPY entrypoint.sh /bin/

USER fluent
