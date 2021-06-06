FROM python:3
ARG fileName=test.py
ARG dir=.
WORKDIR /usr/src/app
COPY . .
CMD [$fileName]
ENTRYPOINT ["python3"]