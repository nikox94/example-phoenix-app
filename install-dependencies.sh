#!/bin/bash
mix local.rebar --force # for Elixir 1.3.0 and up
mix local.hex --force
mix deps.get