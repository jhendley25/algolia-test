import $ from "jQuery"
import _ from "lodash"
import Backbone from "backbone"

import HomeView from "../views/home-view"


const Router = Backbone.Router.extend({
  routes: {
    '': 'home',
    'somewhere': 'somewhere'
  },
  execute: function(cb, args) {
    cb.apply(this, args)
  },
  home: function() {
    new HomeView();
  }
})

export default Router
