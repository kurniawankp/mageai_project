FROM mageai/mageai:0.9.76

ARG PROJECT_NAME
ARG USER_CODE_PATH=/home/src/${PROJECT_NAME}
RUN echo "USER_CODE_PATH: ${USER_CODE_PATH}"

RUN addgroup --system mageuser && adduser --system --ingroup mageuser mageuser

COPY requirements.txt ${USER_CODE_PATH}/requirements.txt 

RUN pip3 install -r ${USER_CODE_PATH}/requirements.txt

user mageuser