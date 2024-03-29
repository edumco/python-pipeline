# Testing with PyTest

To test an python app is necessary to use some test toll like nose or Pytest. Ins this example we use PyTest for simplicity.

## Writting the tests

Pytest searches for tests based on the naming convention in the test files:

1. Test cases are functions with name starting with `test_`

2. Test files should start with `test_`

3. Classes with tests should end with `_Tests`

All test cases should consist at least of an assertion

```python
def test_pass():
    assert True
```

## Configuring PyTest

If you want to use your own name convention or configure other properties you can do it by creating a `pytest.ini` in the root of the test folder.

In this example I just configure the junit report to generate files in the old format to be used on CI-CD tools

```ini
# content of pytest.ini
[pytest]
junit_family=legacy
```

## Test Requirements

Its a good practicie use a exclusive requiremts file for the testing because these tools should not be package together with the application.

So we create a second requirements file in the test folder.

```python
bandit==1.7.0
pylama==7.7.1
pytest==6.2.5
pytest-xdist==2.4.0
```

The contents of this file are packages used to run the tests (`pytest` and `pytest-xdist`) and verify the code (`pylama` and `bandit`).

## Dockerfile layer

On the Dockerfile we create a new layer reusing the requirement layer and naming it as test. Then we copy the app code, install the test requirements and execute the tests:

```Dockerfile
WORKDIR /app 

COPY requirements.txt requirements.txt

RUN pip install -r requirements.txt && pip check

FROM requirements as test

COPY src /app

RUN pip install -r /test/requirements.txt

RUN pytest -n 4
```

The command who execute the tests is

```Dockerfile
RUN pytest --junit-xml=/reports/unit.xml
```

It calls the pytest packaging passing the option `--junit-xml` that generate a report in the given path.

The pytest command searches for python tests and find a simple test we added before.
