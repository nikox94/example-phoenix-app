#!/bin/bash

# Kubectl
curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.11.2/bin/linux/amd64/kubectl
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl

# Elixir deps
mix local.rebar --force # for Elixir 1.3.0 and up
mix local.hex --force
mix deps.get
