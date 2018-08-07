# Example Phoenix app

![build pipeline](./build_pipeline.svg)

# Running

You can run the app by downloading the docker container and running it locally.
```
docker pull firestarter/example-phoenix-app
docker run --network=host firestarter/example-phoenix-app
```
Visit http://localhost:8080 from your browser.

*Note: you need to have a local PostgreSQL instance with user:postgres and pass:postgres*
You can also point the image to another host using:
```
docker run --network=host -e DATABASE_HOST=85.121.103.12 firestarter/example-phoenix-app
```
Available environment variables are:
  * DATABASE_HOST
  * DATABASE_USER
  * DATABASE_PASS

# Hello

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  * Install Node.js dependencies with `cd assets && npm install`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](http://www.phoenixframework.org/docs/deployment).

## Learn more

  * Official website: http://www.phoenixframework.org/
  * Guides: http://phoenixframework.org/docs/overview
  * Docs: https://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix
