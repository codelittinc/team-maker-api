# Team Maker API

## Getting started

1. Clone the project
2. [Install docker](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-18-04)
3. Inside the project folder run `sh bin/dev`
4. Inside the docker console run:
```
  cp config/database.dev.yml config/database.yml
  bundle exec rake db:create
  bundle exec rake db:migrate
  bundle exec rake db:seed

  rails s
```
5. Go to your browser and access `http://localhost:3000`

