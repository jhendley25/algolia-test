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
    console.log("HomeView initialized, options are ", options);

    this.render()
  },

  render: function() {

    this.$el.html(template({msg:"test", resp:"cool"}))
    innerHTML($(".main")[0], this.$el)

    return this
  },

  handleIt: function() {
    console.log("click fired");
  }
})
export default HomeView
