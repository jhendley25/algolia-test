import $ from "jQuery"
import _ from "lodash"
import Backbone from "backbone"

import SearchView from "../views/search-view"


const Router = Backbone.Router.extend({
  routes: {
    '': 'search',
    'search(/:query)(/:category)': 'search'
  },
  execute: function(cb, args) {
    cb.apply(this, args)
  },
  search: function(query,category) {
    new SearchView({query:query, category:category});
  }
})

export default Router
