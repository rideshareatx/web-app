$(document).ready(function(){

  var client = new Usergrid.Client({
    orgName: 'test-organization',
    appName: 'newapp',
    URI: 'http://localhost:8080',
    qs: {
      access_token: 'YWMtYiWBciqfEeaNo2-Y7JE8FQAAAVVBeJ2B0IwJJREWMqqgerGVePS2fytimTE'
    }
  });

  var options = {
    method: 'GET',
    endpoint: 'places'
  };

  client.request(options, function(error, data) {
    var $placeSelect = $('select.place-select');
    $placeSelect.empty();
    $.each(data.entities, function(index, entity) {
      $placeSelect.append('<option value="' + entity.uuid + '">' + entity.name + '</option>');
    });
  });

});