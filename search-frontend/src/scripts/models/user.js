import $ from "jQuery"
import Backbone from "backbone"

import config from "../config/config"

const User = Backbone.Model.extend({
  urlRoot: `${config.arkiverApiUrl}`,
  initialize: function(){
    console.log("initialize called, this is ", this);
  },
  login: function(email, password){
    log("user login begins")
    return new Promise((resolve) => {
      // var queryString = jQuery.param({'email': email, 'password': password});
      const payload =   {
        "user":{
          "email": email,
          "password": password
        }
      };
      $.post(`${this.urlRoot}/login`, JSON.stringify(payload), (resp) => {
        console.log("user login successful, resp is" , resp);
        localStorage["arkiver_user_token"] = resp.authentication_token
        localStorage["arkiver_user_email"] = email
        this.attributes = resp
        resolve()
      })
    })
  },
  signUp: function(email, fullName, password){
    return new Promise((resolve) => {

      const newUserData = {
        "user":{
            "first_name": fullName.split(" ")[0],
            "last_name": fullName.split(" ")[1] || "",
            "email": email,
            "password": password,
            "password_confirmation": password

        },
        "origin": "web"
      }

      $.post(`${this.urlRoot}/signup`, JSON.stringify(newUserData), (resp) => {
        log("ok user is created i guess", resp)
        localStorage["arkiver_user_token"] = resp.authentication_token
        localStorage["arkiver_user_email"] = email
        resolve()
      });
    })
  }
});

export default User
