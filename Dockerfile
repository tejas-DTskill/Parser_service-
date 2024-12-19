FROM python:3.10-slim
WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
RUN pip install gunicorn
COPY . .
EXPOSE 8001
CMD ["gunicorn", "--bind", "0.0.0.0:8001", "--timeout", "60", "app:app"]
