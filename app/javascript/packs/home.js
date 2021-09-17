$(function () {
  $("#login").on("click", function () {
    $("#sign-up-form").hide();
    $("#sign-in-form").show();
  });

  $("#signup").on("click", function () {
    $("#sign-in-form").hide();
    $("#sign-up-form").show();
  });
});