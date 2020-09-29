$(function () {
  $("#collected_ink_brand_name").autocomplete({
    source: function (request, response) {
      fetch("/brands?term=" + encodeURIComponent(request.term))
        .then(function (r) {
          return r.json();
        })
        .then(function (r) {
          var names = $.map(r.data, function (e) {
            return e.attributes.name;
          });
          response(names);
        });
    },
  });

  $("#collected_ink_line_name").autocomplete({
    source: function (request, response) {
      fetch("/lines?term=" + encodeURIComponent(request.term))
        .then(function (r) {
          return r.json();
        })
        .then(function (r) {
          var names = $.map(r.data, function (e) {
            return e.attributes.line_name;
          });
          response(names);
        });
    },
  });

  $("#collected_ink_ink_name").autocomplete({
    source: function (request, response) {
      fetch("/inks?term=" + request.term)
        .then(function (r) {
          return r.json();
        })
        .then(function (r) {
          var names = $.map(r.data, function (e) {
            return e.attributes.ink_name;
          });
          response(names);
        });
    },
  });
});
