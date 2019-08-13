FROM python:3.7

WORKDIR /app

# Install poetry
RUN pip install poetry && poetry config settings.virtualenvs.create false

# Add requirements now (allows caching of pip dependencies for faster builds)
COPY poetry.lock pyproject.toml ./

# Install requirements
RUN poetry install --no-interaction

# Add everything else the app may need (including templates)
# into the container.
COPY . .

EXPOSE 8000

CMD ["gunicorn", "-k", "uvicorn.workers.UvicornWorker", \
     "-b", "0.0.0.0:8000", "chatbot.asgi:app"]

