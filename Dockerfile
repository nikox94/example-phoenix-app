FROM bitwalker/alpine-elixir-phoenix:latest

# Expose ports
EXPOSE 8080
ENV PORT 8080
ENV MIX_ENV prod

# Cache elixir deps
ADD mix.exs mix.lock ./
RUN mix local.hex --force
RUN mix local.rebar --force
RUN mix deps.get
RUN mix deps.compile

# Same with npm deps
ADD assets/package.json assets/
RUN cd assets && \
    npm install

ADD . .

# Run frontend build, compile, and digest assets
RUN cd assets/ && \
    npm run deploy && \
    cd - && \
    mix do compile, phx.digest

USER default

CMD ["mix", "phx.server"]
