import $ from "jQuery"
import Backbone from "backbone"

import config from "../config/config"

const SearchCollection = Backbone.Collection.extend({
  urlRoot: `${config.apiUrl}`,
  initialize: function(){
    console.log("initialize called, this is ", this);
    this.sortOrder = "DESC"
    this.sort()
  },
  comparator: function(item) {
    if (this.sortOrder == "DESC") {
      return -item.get('rating');
    } else {
      return item.get('rating');
    }
  }
})

export default SearchCollection
