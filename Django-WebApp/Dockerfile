# Use an official Python runtime as a parent image
FROM python:3.13.0a1-bookworm

# Set environment variables for Django
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1
ENV DJANGO_SETTINGS_MODULE=django_web_app.settings

# Set the working directory in the container
WORKDIR /app

# Copy your project files into the container
COPY . /app

# Install additional Python modules required for your project
RUN pip3 install -r requirements.txt --no-cache-dir

# Install django-crispy-forms with bootstrap4
RUN pip3 install django-crispy-forms[bootstrap4]
RUN pip install crispy-bootstrap4


# Expose a port if needed (e.g., for Django development server)
EXPOSE 8000

# Start your Django application (customize this according to your project)
ENTRYPOINT ["python3"]
CMD ["django_web_app/manage.py", "runserver", "0.0.0.0:8000"]
