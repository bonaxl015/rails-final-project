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
    if ($(".comment-toggle").text() == "View Comments")
      $(".comment-toggle").text("Hide Comments");
    else $(".comment-toggle").text("View Comments");
  });

  $(".likers-btn").on("click", function () {
    $(this).addClass("active");
  });

  $(".close-likers-btn").on("click", function () {
    $(".likers-btn").removeClass("active");
  });
});
