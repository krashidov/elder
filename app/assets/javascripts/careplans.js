// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

function transformClientDataForSelect(data) {
  return data.map(function (entity) {
    var text = entity.last_name + ', ' + entity.first_name + ' ' + entity.date_of_birth;
    return { id: entity.id, text: text };
  });
}

function onLoad(elementId, data) {
  var transformedData = transformClientDataForSelect(data);
  $(elementId).select2({
    data: transformedData,
  });
}

function onFail() {
  console.log("shit failed");
}

function loadPicker(pickerType) {
  var elementId = '#careplan-' + pickerType + '-picker';
  if ($(elementId).length) {
    $.get('../' + pickerType + 's.json', function (data) {
      onLoad(elementId, data);
    }).fail(onFail);
  }
}


jQuery(document).on('turbolinks:load', function () {
  loadPicker('client');
  loadPicker('provider');

  $('#careplans-table').DataTable({
    "processing": true,
    "serverSide": true,
    "ajax": $('#careplans-table').data('source'),
    "pagingType": "full_numbers",
    "columns": [
      { data: 'start_date' },
      { data: 'provider_last_name' },
      { data: 'provider_first_name' },
      { data: 'client_last_name' },
      { data: 'client_first_name' },
      { data: 'actions', sortable: false },
    ],
  });
});