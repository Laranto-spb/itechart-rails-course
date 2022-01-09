import flatpickr from "flatpickr";
require("flatpickr/dist/flatpickr.css")

document.addEventListener("turbolinks:load", () => {
  flatpickr("[data-behavior = 'flatpickr']", {
    
  })
})