# Python Pipeline 🐍

Simple Docker pipeline to test your python code.

## Features

In this repo i've add a very basic python project with only four elements: a requirements file, a Dockerfile, a pytest.ini file and a simple python test that always pass.

You can put several stages to your pipeline, but the most common stages are: Build, Test, Lint, Report, Tag.

1. [Build](docs/dependencies.md): Downloads and build dependencies.
2. [Test](docs/tests.md): Executes all tests found.
3. [Lint](docs/lint.md): Checks code style and bad code practicies.
4. [Report](docs/reports.md): Formats and exports the results to archiving.
5. [Tag](docs/tagging.md): Adds a unique identifier to the version making it ready to release.

## Installation

1. Clone or download this repository.

2. Move your code to this new structure or vice versa.

3. Make sure the `Dockerfile` is on project root folder.

4. Update the requiments with your dependencies or create your list of requirements. [See the dependencies tutorial to more details.](docs/dependencies.md)

5. Make sure the name patterns on `pytest.ini`

6. Make sure you have at least one passing test (there's one in test-pass.py)

7. In `Dockerfile` rename the `src` folder following your project organizaziton.

## Usage

Execute the docker build command

```bash
docker build -t your-docker-user/projetc-name:tag .
```

If every step works correctly the command `docker images` is going to list your newly created image.

If something goes wrong youll be promptly warned.

## License

[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)
