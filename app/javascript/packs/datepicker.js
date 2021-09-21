$(function () {
  $("#start_datepicker, #end_datepicker").flatpickr({
    enableTime: true,
    dateFormat: "D, d M Y H:i",
    minDate: new Date().fp_incr(1)
  });
});
