import $ from "jQuery"
import Backbone from "backbone"
import Router from "../routers/router"
import sayHello from "./test-controller"


class AppController {
  constructor(options = {}) {
    this.init()
  }

  init() {
    console.log("init");
    new Router();
    Backbone.history.start();


  }
}

export default AppController
