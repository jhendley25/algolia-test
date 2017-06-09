import $ from "jQuery"
import _ from "lodash"
import Backbone from "backbone"
import template from "../templates/hello.jade"

import {
  first,
  second
} from "../views/_manifest"

const Router = Backbone.Router.extend({
  routes: {
    '': 'home',
    'somewhere': 'somewhere'
  },
  execute: function(cb, args) {
    cb.apply(this, args)
  },
  home: function() {

    $(".main").append(template({
      msg:"cool story bro",
      resp: "tell it again"
    }))
    first()
    second()

  }
})

export default Router
