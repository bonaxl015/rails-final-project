$(function () {
  if ($("#caption").val() == "") {
    $("#create-post-button").prop("disabled", true);
  }

  $("#caption").on("keyup", function () {
    if ($("#caption").val() != "")
      $("#create-post-button").prop("disabled", false);
    else $("#create-post-button").prop("disabled", true);
  });

  if ($(".comment").val() == "") {
    $(".create-comment-button").prop("disabled", true);
  }

  $(".comment").on("keyup", function () {
    if ($(this).val() != "")
      $(this).closest(".comment-text-button").find(".create-comment-button").prop("disabled", false);
    else
      $(this).closest(".comment-text-button").find(".create-comment-button").prop("disabled", true);
  });

  $(".comment-toggle").on("click", function () {
    $(this).closest(".comment-box").find(".comment-display").toggle("slow");
    if ($(this).text() == "View Comments")
      $(this).text("Hide Comments");
    else if ($(this).text() == "Hide Comments")
      $(this).text("View Comments");
  });

  $(".btn-comment").on("click", function () {
    $(this).closest(".post-card").find(".comment").trigger("focus");
  });

  $(".likers-btn").on("click", function () {
    $(this).addClass("active");
  });

  $(".close-likers-btn").on("click", function () {
    $(".likers-btn").removeClass("active");
  });
});
