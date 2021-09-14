$(function () {
  $("#datepicker").datepicker({
    dateFormat: "D, dd M yy",
    firstDay: 1,
    minDate: 0,
  });

  $("#caption").on("keyup", function () {
    if ($("#caption").val() != "")
      $("#create-post-button").prop("disabled", false);
    else $("#create-post-button").prop("disabled", true);
  });
});
