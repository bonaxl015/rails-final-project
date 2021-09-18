$.ajax({
  type: "GET",
  url: "https://api.spaceflightnewsapi.net/v3/articles?_limit=3",
  dataType: "json",
  success: function success(data) {
    if (data.length != 0){
      for(var i in data){
        $("#news-content").append(
          `<div class="news-card">
            <img src=${data[i]["imageUrl"]} alt="No image available" class="img img-fluid">
            <a href="${data[i]["url"]}" target="_blank"> ${data[i]["title"]} </a>
          </div>`
        )
      }
    }else{
      alert('Unable to get the latest news.');
    }
  },
  error: function error(request, _error) {}
});