// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

function transformClientDataForSelect(data) {
  return data.map(function(client) {
    var text = client.last_name + ', ' + client.first_name + ' ' + client.date_of_birth;
    return {id: client.id, text: text};
  });
}

function onClientLoad(data) {
  var transformedData = transformClientDataForSelect(data);
  $("#careplan-client-picker").select2({
    data: transformedData,
  });
}

function onFail() {
  console.log("shit failed");
}


jQuery(document).on('turbolinks:load', function() {
  if($("#careplan-client-picker").length) {
    $.get('../clients.json', onClientLoad)
      .fail(onFail);
  }

  $('#careplans-table').DataTable({
    "processing": true,
    "serverSide": true,
    "ajax": $('#careplans-table').data('source'),
    "pagingType": "full_numbers",
    "columns": [
      {data: 'start_date'},
      {data: 'provider_last_name'},
      {data: 'provider_first_name'},
      {data: 'client_last_name'},
      {data: 'client_first_name'},
      {data: 'actions', sortable: false},
    ],
  });
});