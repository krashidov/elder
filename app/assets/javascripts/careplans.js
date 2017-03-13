// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

jQuery(document).on('turbolinks:load', function() {
  $('#careplans-table').DataTable({
    "processing": true,
    "serverSide": true,
    "ajax": $('#careplans-table').data('source'),
    "pagingType": "full_numbers",
    "columns": [
      {data: 'provider_last_name'},
      {data: 'provider_first_name'},
      {data: 'client_last_name'},
      {data: 'client_first_name'},
    ],
  });
});