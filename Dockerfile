FROM mageai/mageai:0.9.76

ARG PROJECT_NAME
ARG USER_CODE_PATH=/home/src/${PROJECT_NAME}
RUN echo "USER_CODE_PATH: ${USER_CODE_PATH}"

RUN addgroup --system mageuser && adduser --system --ingroup mageuser mageuser

COPY requirements.txt ${USER_CODE_PATH}/requirements.txt 

RUN pip3 install --no-cache-dir --upgrade pip && \
    pip3 install --no-cache-dir -r ${USER_CODE_PATH}/requirements.txt && \
    rm -rf /root/.cache/pip

RUN chown -R mageuser:mageuser /home/src

user mageuser

HEALTHCHECK --interval=30s --timeout=10s --start-period=60s --retries=3 \
    CMD curl -f http://localhost:6789/api/status || exit 1
