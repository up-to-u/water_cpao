FROM python:3.10.4

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# WORKDIR /app

COPY requirements.txt .
RUN pip install --upgrade pip
RUN pip install --no-cache-dir -r requirements.txt

# COPY . .

# Collect static + migrate DB (ใช้ได้ทั้ง dev/prod)
# RUN python manage.py collectstatic --no-input
# RUN python manage.py makemigrations
# RUN python manage.py migrate

# เปิด port ทั้ง dev + prod
EXPOSE 5005 8000

# Default command → ใช้ Gunicorn สำหรับ production
CMD ["gunicorn", "--config", "gunicorn-cfg.py", "core.wsgi"]
