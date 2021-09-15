$(function () {
  $("#login").on("click", function () {
    $("#sign-up-form").hide();
    $("#sign-in-form").show();
    console.log("click login");
  });

  $("#signup").on("click", function () {
    $("#sign-in-form").hide();
    $("#sign-up-form").show();
    console.log("click signup");
  });
});