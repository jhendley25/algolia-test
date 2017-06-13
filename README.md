# Algolia test app

## Example curls for creating and deleting apps


### Create

```
curl https://immense-ridge-74191.herokuapp.com/api/1/apps \
    -X POST \
    -H 'Content-Type: application/json' \
    -H "Accept: text/html,application/json" \
    -d '{"mobile_app":{"category":"Games","rating": 5, "name": "best ever", "image":"http://fillmurray.com/60/60", "link":"http://notareallink.com", "rating_count": 12345, "price": "123 USD"}}'
```

### Delete

```
curl -X DELETE https://immense-ridge-74191.herokuapp.com/api/1/apps/1000
```

Note that the apps search index should be immediately updated after creation/deletion.


## API notes

The api is a minimal rails 5 app that exposes the above endpoints and handles seeding the database with data from `https://gist.githubusercontent.com/vvo/08850adfc3736869f04bcf5586418add/raw/300a2d9804cfecc549cfd1e209c1e4f25b39dd79/data.json`

A few things to note:

- the Algolia index is updated via model hooks in [search-api/app/models/mobile_app.rb](search-api/app/models/mobile_app.rb)
- the database seeder utilities can be found in [search-api/app/helpers](search-api/app/helpers) and are run via migrations. I probably wouldn't normally do the seeding in migrations but it works well for the small scope of this app.


## Frontend notes

The frontend is built using Backbone and es7, with all the tooling in the package.json. The general structure of the code is the result building a large backbone application and needing to improve the development experience without being able to rewrite it using React or something similar. I'm happy to chat more about this. One thing in particular to check out is the use of the `diffhtml` package, which is similar to React's virtual dom rendering engine.

## Local dev

Running the api locally is standard rails stuff - make sure Postgres is running and then run `rails server`. Running `rake db:migrate` the first time will seed the local database and the Algolia index.

Front end development is handled by `npm start`, which spins up a local server and watches for changes (I've run into an issue before where the server errors if the `dist` folder is empty so if that happens just run `mkdir -p dist/css dist/js/ dist/images dist/videos; touch dist/js/bundle.js; touch dist/css/manifest.css`).
