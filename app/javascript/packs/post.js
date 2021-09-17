$(function () {
  if ($("#caption").val() == "") {
    $("#create-post-button").prop("disabled", true);
  }

  $("#caption").on("keyup", function () {
    if ($("#caption").val() != "")
      $("#create-post-button").prop("disabled", false);
    else $("#create-post-button").prop("disabled", true);
  });

  $(".likers-btn").on("click", function () {
    $(this).addClass("active");
  });

  $(".close-likers-btn").on("click", function () {
    $(".likers-btn").removeClass("active");
  })
});
