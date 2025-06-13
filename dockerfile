# Gunakan base image Python versi ringan
FROM python:3.12-slim

# Set direktori kerja di dalam container
WORKDIR /app

# Salin semua file ke container
COPY . .

# Install dependensi Python dari requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Buka port Flask/Gunicorn
EXPOSE 5000

# Jalankan app menggunakan Gunicorn (untuk production)
CMD ["gunicorn", "--bind", "0.0.0.0:5000", "main:app"]
