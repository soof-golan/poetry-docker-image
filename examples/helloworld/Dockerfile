FROM soofgolan/poetry:3.10-alpine

WORKDIR /app

COPY pyproject.toml poetry.lock ./

RUN poetry check
RUN poetry lock --check
RUN poetry install --without dev

CMD [ "poetry", "run", "python", "-c", "print('Hello, World! 🌍')" ]
