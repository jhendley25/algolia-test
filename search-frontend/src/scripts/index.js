import $ from "jQuery";
import AppController from "./controllers/app-controller";

$(() => {
  console.log("pageload!");
  new AppController();
})
