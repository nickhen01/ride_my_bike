import flatpickr from "flatpickr"
import "flatpickr/dist/themes/airbnb.css" // Note this is important!

flatpickr(".datepicker", {
  altInput: true,
  enableTime: true,
  minDate: "today",
  dateFormat: "Y-m-d H:i",
  disable: JSON.parse(document.getElementById("booking_dates").dataset.array)
})

