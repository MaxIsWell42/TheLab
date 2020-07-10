FROM python:3.7

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /usr/src/app
COPY requirements.txt ./
RUN pip install -r requirements.txt
COPY . .
# added this to run bash commands
RUN chmod +x docker-entrypoint.sh
EXPOSE 8000
# CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
ENTRYPOINT ["sh", "./docker-entrypoint.sh"]