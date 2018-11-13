import flatpickr from "flatpickr"
import "flatpickr/dist/themes/airbnb.css"

flatpickr(".datepicker", {
  altInput: true,
  enableTime: true,
  dateFormat: "Y-m-d H:i"
})
// Bens Genius Code
// finishedStartTime = parseInt(document.getElementById('search_pick_up').value.split(' ')[0].split('-').join(''))
// finishedEndTime = parseInt(document.getElementById('search_drop_off').value.split(' ')[0].split('-').join(''))

flatpickr({
    "plugins": [new rangePlugin({ input: "#secondRangeInput"})]
});

var a = document.getElementById('search_pick_up').value
var b = document.getElementById('search_drop_off').value
var milliseconds = ((new Date(a)) - (new Date(b)))
var minutes = milliseconds/(60000)
var hours = minutes/(60)
