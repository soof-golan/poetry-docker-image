ARG PYTHON_VERSION

FROM python:$PYTHON_VERSION as python-base

ARG POETRY_VERSION

# https://python-poetry.org/docs#ci-recommendations
ENV POETRY_HOME=/opt/poetry
ENV POETRY_VENV=/opt/poetry-venv
ENV POETRY_NO_INTERACTION=1
ENV POETRY_VERSION=$POETRY_VERSION 

# Add Poetry to PATH
ENV PATH="${PATH}:${POETRY_VENV}/bin"

# Tell Poetry where to place its cache and virtual environment
ENV POETRY_CACHE_DIR=/opt/.cache

# Create stage for Poetry installation
FROM python-base as poetry-base

# Creating a virtual environment just for poetry and install it with pip
RUN python3 -m venv $POETRY_VENV \
    && $POETRY_VENV/bin/pip install -U pip setuptools \
    && $POETRY_VENV/bin/pip install poetry==$POETRY_VERSION

# Create a new stage from the base python image
FROM python-base as poetry

# Copy Poetry to app image
COPY --from=poetry-base ${POETRY_VENV} ${POETRY_VENV}

# Verify poetry is accessible
RUN poetry --version
