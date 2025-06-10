You can develop on your computer using the `default.nix` and
then you can deploy the app anywhere using the same `default.nix`.
You can also *dockerize* the app and use the `default.nix` to
restore the development environment in the Docker image.

Build image with: `docker build -t nix_shiny_example .`

run container with: `docker run --rm -p 4000:3838 --name my_container nix_shiny_example`

(replace 4000 with whatever port is available and visit http://localhost:4000/)