FROM soofgolan/poetry:3.10

WORKDIR /app

COPY pyproject.toml poetry.lock ./

RUN poetry install

CMD [ "poetry", "run", "python", "-c", "print('Hello, World!')" ]
