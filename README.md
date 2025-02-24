![EPFL Center for Imaging logo](https://imaging.epfl.ch/resources/logo-for-gitlab.svg)
# serverkit-spotiflow

Implementation of a web server for [Spotiflow](https://github.com/weigertlab/spotiflow).

## Installing the algorithm server with `pip`

Install dependencies:

```
pip install -r requirements.txt
```

Run the server:

```
uvicorn main:app --host 0.0.0.0 --port 8000
```

The server will be running on http://localhost:8000.

## Endpoints

A documentation of the endpoints is automatically generated at http://localhost:8000/docs.

**GET endpoints**

- http://localhost:8000/ : Running algorithm message.
- http://localhost:8000/version: Version of the `imaging-server-kit` package.
- http://localhost:8000/spotiflow/info: Web page displaying project metadata.
- http://localhost:8000/spotiflow/demo: Plotly Dash web demo app.
- http://localhost:8000/spotiflow/parameters: Json Schema representation of algorithm parameters.
- http://localhost:8000/spotiflow/sample_images: Byte string representation of the sample images.

**POST endpoints**

- http://localhost:8000/spotiflow/process: Processing endpoint to run the algorithm.

## Running the server with `docker-compose`

To build the docker image and run a container for the algorithm server in a single command, use:

```
docker compose up
```

The server will be running on http://localhost:8000.

## Running the server with `docker`

Build the docker image:

```
docker build -t serverkit-spotiflow .
```

Run the server in a container:

```
docker run -it --rm -p 8000:8000 serverkit-spotiflow:latest
```

The server will be running on http://localhost:8000.

## Running unit tests

If you have implemented unit tests in the [tests/](./tests/) folder, you can run them using pytest:

```
pytest
```

if you are developing your server locally, or

```
docker run --rm serverkit-spotiflow:latest pytest
```

to run the tests in a docker container.

## [EPFL only] Publishing a docker image to [registry.rcp.epfl.ch](https://registry.rcp.epfl.ch/)

```
docker tag serverkit-spotiflow registry.rcp.epfl.ch/imaging-server-kit/serverkit-spotiflow
docker push registry.rcp.epfl.ch/imaging-server-kit/serverkit-spotiflow
```

## Sample images provenance

- `hybiss_2d.tif`: Single test HybISS image from the Spotiflow paper (doi.org/10.1101/2024.02.01.578426).
