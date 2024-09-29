# Python 3.8-slim imajını kullan
FROM python:3.8-slim

# Çalışma dizinini oluştur
WORKDIR /usr/src/app

# app.py dosyasını konteynıra kopyala
COPY deneme.py ./

CMD ["python", "./deneme.py"]
