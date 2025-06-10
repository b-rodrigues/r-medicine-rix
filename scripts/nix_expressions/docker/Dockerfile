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

# Adds Nix to the path, as described by the Determinate Systems installer's documentation
ENV PATH="${PATH}:/nix/var/nix/profiles/default/bin"
ENV user=root

# Set up rstats-on-nix cache
# Thanks to the rstats-on-nix cache, precompiled binary packages will
# be downloaded instead of being compiled from source
# without the cache, building this image takes more than 10 minutes on
# a last generation business laptop. With the cache, it only takes about 5 minutes.
RUN mkdir -p /root/.config/nix && \
    echo "substituters = https://cache.nixos.org https://rstats-on-nix.cachix.org" > /root/.config/nix/nix.conf && \
    echo "trusted-public-keys = cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY= rstats-on-nix.cachix.org-1:vdiiVgocg6WeJrODIqdprZRUrhi1JzhBnXv7aWI6+F0=" >> /root/.config/nix/nix.conf

# This will overwrite the default.nix we downloaded with a new one
RUN nix-shell --run "Rscript generate_env.R"

RUN nix-build

CMD nix-shell