import $ from "jQuery"
import Backbone from "backbone"
import { innerHTML } from "diffhtml"

import template from "../templates/home/home.jade"


const HomeView = Backbone.View.extend({
  className: "home-view",
  events: {
    "click .heading": "handleIt"
  },

  initialize: function(options = {}) {
    log("HomeView initialized, options are ", options);
  },

  render: function() {

    this.$el.html(template(this.homeData))
    innerHTML($(".main")[0], this.$el)

    return this
  },

  handleIt: function() {
    log("click fired");
  }
})
export default HomeView
