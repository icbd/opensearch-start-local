ARG OPENSEARCH_VERSION=2.11.1
FROM opensearchproject/opensearch:${OPENSEARCH_VERSION}

ARG OPENSEARCH_VERSION
USER root

RUN yum install -y unzip && \
    yum clean all && rm -rf /var/cache/yum

RUN /usr/share/opensearch/bin/opensearch-plugin install -b repository-s3 --batch && \
    /usr/share/opensearch/bin/opensearch-plugin install -b analysis-kuromoji && \
    /usr/share/opensearch/bin/opensearch-plugin install -b analysis-smartcn && \
    /usr/share/opensearch/bin/opensearch-plugin install -b analysis-icu && \
    /usr/share/opensearch/bin/opensearch-plugin install -b https://get.infini.cloud/opensearch/analysis-ik/${OPENSEARCH_VERSION} && \
    /usr/share/opensearch/bin/opensearch-plugin install -b https://github.com/WorksApplications/elasticsearch-sudachi/releases/download/v3.3.0/opensearch-${OPENSEARCH_VERSION}-analysis-sudachi-3.3.0.zip

# Download and config sudachi dic file
RUN curl -L http://sudachi.s3-website-ap-northeast-1.amazonaws.com/sudachidict/sudachi-dictionary-20240409-core.zip -o /tmp/sudachi-core-dic.zip && \
    unzip -j /tmp/sudachi-core-dic.zip -d /tmp/sudachi-core-dic && \
    mkdir -p /usr/share/opensearch/config/sudachi && \
    mv /tmp/sudachi-core-dic/system_core.dic /usr/share/opensearch/config/sudachi/ && \
    rm /tmp/sudachi-core-dic.zip && \
    rm -rf /tmp/sudachi-core-dic

USER opensearch
