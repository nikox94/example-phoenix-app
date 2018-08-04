FROM bitwalker/alpine-elixir-phoenix:latest

# Expose ports
EXPOSE 8080
ENV PORT 8080
ENV MIX_ENV prod

# Cache elixir deps
ADD mix.exs mix.lock ./
RUN mix do deps.get, deps.compile

# Same with npm deps
ADD assets/package.json assets/
RUN cd assets && \
    npm install

ADD . .

# Add secret
ADD ./config/prod.secret.exs /var/example-phoenix-app/prod.secret.exs

# Run frontend build, compile, and digest assets
RUN cd assets/ && \
    npm run deploy && \
    cd - && \
    mix do compile, phx.digest

USER default

CMD ["mix", "phx.server"]
