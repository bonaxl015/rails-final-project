$(function () {
  $("#followers").on("click", function () {
    $(this).addClass("active")
    $("#following").removeClass("active")
  });

  $("#following").on("click", function () {
    $(this).addClass("active")
    $("#followers").removeClass("active")
  });
});
