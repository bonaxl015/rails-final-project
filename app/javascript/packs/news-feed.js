$(function () {
  $("#caption").on("keyup", function () {
    if ($("#caption").val() != "")
      $("#create-post-button").prop("disabled", false);
    else $("#create-post-button").prop("disabled", true);
  });
});
