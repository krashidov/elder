// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

jQuery(document).ready(function() {
  $('#clients-table').DataTable({
    "processing": true,
    "serverSide": true,
    "ajax": $('#clients-table').data('source'),
    "pagingType": "full_numbers",
    "columns": [
      {data: 'first_name'},
      {data: 'last_name'},
      {data: 'date_of_birth'},
      {data: 'par_expiration'},
    ],
    // optional, if you want full pagination controls.
    // Check dataTables documentation to learn more about
    // available options.
  });
});