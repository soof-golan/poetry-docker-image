FROM soofgolan/poetry:3.10-alpine

WORKDIR /app

COPY pyproject.toml poetry.lock ./

RUN poetry check
RUN poetry lock --check
RUN poetry install --without dev

COPY . /app

EXPOSE 5000

CMD [ "poetry", "run", "flask", "run", "--host=0.0.0.0" ]
