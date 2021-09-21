$(function () {
  $("#relationships-btn").on("click", function () {
    $(".nav-link.active").prop("disabled", true);
    $(".tab-modal").hide();
    $(".tab-modal.active").show();
  });

  $("#relationships-nav > .nav-item > .nav-link").on("click", function () {
    $("#relationships-nav > .nav-item > .nav-link").removeClass("active");
    $("#relationships-nav > .nav-item > .nav-link").prop("disabled", false);
    $(this).addClass("active");
    $(this).prop("disabled", true);
    $(".tab-modal").toggle(250);
  });
});
