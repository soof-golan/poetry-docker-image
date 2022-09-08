# poetry-docker-image

Dockerize your Poetry-managed applications with style 

# TL;DR - Use this as your reference

```Dockerfile
FROM soofgolan/poetry:3.10-alpine

WORKDIR /app

COPY pyproject.toml poetry.lock ./

RUN poetry check
RUN poetry lock --check
RUN poetry install --without dev

CMD [ "poetry", "run", "python", "-c", "print('Hello, World! 🌍')" ]
```

# Supported Versions

Any combination from these options should work:

* Python Version: 3.7, 3.8, 3.9, 3.10
* Platforms: linux/amd64, linux/arm64
* Base Image: python, python-slim, python-alpine

## Some example tags:

* soofgolan/poetry:3.10
* soofgolan/poetry:3.7-slim
* soofgolan/poetry:3.7
* soofgolan/poetry:3.9-alpine
