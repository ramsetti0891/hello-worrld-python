FROM python:3.12-slim

RUN usersdd -m ram
USER ram
CMD ["SLEEP", "600"]

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
COPY hello.py .
EXPOSE 8021
CMD ["python", "hello.py"]
