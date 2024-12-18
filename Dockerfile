ARG OPENSEARCH_VERSION=2.11.1
FROM opensearchproject/opensearch:${OPENSEARCH_VERSION}

ARG OPENSEARCH_VERSION
USER root

RUN /usr/share/opensearch/bin/opensearch-plugin install -b analysis-icu
RUN /usr/share/opensearch/bin/opensearch-plugin install -b analysis-kuromoji
RUN /usr/share/opensearch/bin/opensearch-plugin install -b https://get.infini.cloud/opensearch/analysis-ik/${OPENSEARCH_VERSION}
RUN /usr/share/opensearch/bin/opensearch-plugin install -b https://github.com/WorksApplications/elasticsearch-sudachi/releases/download/v3.3.0/opensearch-${OPENSEARCH_VERSION}-analysis-sudachi-3.3.0.zip

USER opensearch
