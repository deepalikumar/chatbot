FROM python:3.7

# Add requirements now (allows caching of pip dependencies for faster builds)
COPY poetry.lock pyproject.toml ./

# Install requirements
RUN pip install poetry && poetry config settings.virtualenvs.create false && \
    poetry install --no-interaction

# Add everything else the app may need (including templates)
# into the container.
COPY . ./

EXPOSE 8000

CMD ["uvicorn", "chatbot.asgi:app", "--host 0.0.0.0", "--reload"]

