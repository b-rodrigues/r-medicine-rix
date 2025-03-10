FROM ubuntu:latest

RUN apt update -y

RUN apt install curl -y

# Get a default.nix with R and rix
RUN curl -O https://raw.githubusercontent.com/b-rodrigues/rix/master/inst/extdata/default.nix

# Copy a script to generate the environment of interest using rix
COPY generate_env.R .

RUN curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install linux \
  --extra-conf "sandbox = false" \
  --init none \
  --no-confirm

ENV PATH="${PATH}:/nix/var/nix/profiles/default/bin"

# This will overwrite the default.nix we downloaded with a new one
RUN nix-shell --run "Rscript generate_env.R"

RUN nix-build

CMD nix-shell