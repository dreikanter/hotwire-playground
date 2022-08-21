# Experimental Rails project

New Rails app options:

```sh
rails new . --database=postgresql --skip-action-mailbox --skip-action-text --skip-active-storage --skip-jbuilder --skip-system-test --javascript=esbuild --css=bootstrap
```

Manual Hotwire installation to existing project (new Rails 7+ apps suppose to have Hotwire enabled unless `--skip-hotwire`): https://github.com/hotwired/turbo-rails#installation

Setup:

```sh
docker-compose run dev ./bin/setup
```

Run server:

```sh
docker-compose up dev
```
