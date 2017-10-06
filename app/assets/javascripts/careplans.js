// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

function transformClientDataForSelect(data) {
  return data.map(function (entity) {
    var text = entity.last_name + ', ' + entity.first_name + ' ' + entity.date_of_birth;
    return { id: entity.id, text: text };
  });
}

function onLoad(elementId, data) {
  pickerLoaded = false;
  var transformedData = transformClientDataForSelect(data);
  $(elementId).select2({
    data: transformedData,
  });
}

function onFail() {
  console.log("shit failed");
}

function loadPicker(pickerType) {
  var pickerNeedsToBeLoaded = true;
  var elementId = '#careplan-' + pickerType + '-picker';
  if ($(elementId).length && pickerNeedsToBeLoaded) {
    $.get('../../' + pickerType + 's.json', function (data) {
      onLoad(elementId, data);
    }).fail(onFail);
  }
}

initializeDataTable('#careplans-table', [
  { data: 'start_date' },
  { data: 'provider_last_name' },
  { data: 'provider_first_name' },
  { data: 'client_last_name' },
  { data: 'client_first_name' },
  { data: 'actions', sortable: false },
], function () {
  loadPicker('client');
  loadPicker('provider');
});