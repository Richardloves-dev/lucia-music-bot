FROM python:3.10-slim

RUN apt-get update && apt-get install -y \
    ntpsec-ntpdate \
    tzdata \
    git \
    ffmpeg \
    && rm -rf /var/lib/apt/lists/*

ENV TZ=Asia/Kolkata

WORKDIR /app

COPY requirements.txt .
RUN pip install -r requirements.txt

COPY . .

CMD bash -c "ntpsec-ntpdate -u time.cloudflare.com; python -m YukkiMusic"
