$(document).on('ready page:load', function(event) {

  $(document).on("click",".index_categories .pagination a", function (event) {
    event.preventDefault();
    $.getScript($(this).attr("href"));
    return false;
  });

  $(document).on("keyup",".index_categories #index_categories_search input", function (event) {
    $.get($(".index_categories #index_categories_search").attr("action"), $(".index_categories #index_categories_search").serialize(),null, "script");
    return false;
  });
});
