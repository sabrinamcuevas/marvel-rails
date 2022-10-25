## Marvel Universe

---

This is a very simple project in that it consists of consuming the [Marvel](https://developer.marvel.com/docs) APIs to store the data in a Postgresql database and then putting together a set of endpoints to list and create each section.

To save all the data a task is created where it will run in the background using Sidekiq the data of characters, series, comics and creators.

The frontend is built in React and you can see it [here](https://github.com/sabrinamcuevas/marvel-react).

For this project we used:

Ruby: ![](https://img.shields.io/badge/Ruby-3.0.2-red)

[Webmock](https://github.com/bblimke/webmock) for the tests

[Pagy](https://github.com/ddnexus/pagy) for paging

[Sidekiq](https://github.com/mperham/sidekiq) for background data processing



