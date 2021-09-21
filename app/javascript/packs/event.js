$(function () {
  $("#events-nav > .nav-item > .nav-link.active").prop("disabled", true);
  $(".event-tab-modal").hide();
  $(".event-tab-modal.active").show();

  $("#events-nav > .nav-item > .nav-link").on("click", function () {
    $("#events-nav > .nav-item > .nav-link").removeClass("active");
    $("#events-nav > .nav-item > .nav-link").prop("disabled", false);
    $(this).addClass("active");
    $(this).prop("disabled", true);
    $(".event-tab-modal").hide(250);
    $(`.event-tab-modal.${this.id}`).show(250);
  });

  $("#event-details-nav > .nav-item > .nav-link.active").prop("disabled", true);
  $(".event-details-modal").hide();
  $(".event-details-modal.active").show();

  $("#event-details-nav > .nav-item > .nav-link").on("click", function () {
    $("#event-details-nav > .nav-item > .nav-link").removeClass("active");
    $("#event-details-nav > .nav-item > .nav-link").prop("disabled", false);
    $(this).addClass("active");
    $(this).prop("disabled", true);
    $(".event-details-modal").toggle(250);
  });

  $(".event-modal")
    .find(".btn-close")
    .on("click", function () {
      $("#event-details-nav > .nav-item > .nav-link").prop("disabled", false);
      $("#event-details-nav > .nav-item > .nav-link").removeClass("active");
      $("#event-details-nav > .nav-item:first-child > .nav-link").addClass("active");
      $("#event-details-nav > .nav-item > .nav-link.active").prop(
        "disabled",
        true
      );
      $(".event-details-modal").hide(250);
      $(".event-details-modal.active").show(250);
    });
});
