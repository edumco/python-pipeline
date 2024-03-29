FROM python:3.10.4-alpine3.14 as requirements

WORKDIR /app

COPY requirements.txt requirements.txt

RUN pip install -r requirements.txt && pip check



FROM requirements as tests

COPY tests/requirements.txt tests/requirements.txt

RUN pip install -r tests/requirements.txt && pip check

COPY . /app

RUN pytest --html=results.html 

RUN bandit --skip B101 -r tests

RUN pylama --verbose --linters pydocstyle,pycodestyle,pyflakes tests/



FROM requirements as production

COPY module /module

WORKDIR /module

ENTRYPOINT [ "python", "main.py" ]
