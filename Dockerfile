# Gunakan base image Python versi ringan
FROM python:3.12-slim

# Set direktori kerja di dalam container
WORKDIR /app

# Salin semua file ke container
COPY . .

# Install dependensi Python dari requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# ✅ Tambahkan ini (debug)
RUN ls -R /app

# Buka port Flask/Gunicorn
EXPOSE 80

# Jalankan app menggunakan Gunicorn (untuk production)
CMD ["gunicorn", "--bind", "0.0.0.0:80", "main:app"]
