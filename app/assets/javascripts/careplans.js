// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

jQuery(document).on('turbolinks:load', function() {
  $('#providers-table').DataTable({
    "processing": true,
    "serverSide": true,
    "ajax": $('#providers-table').data('source'),
    "pagingType": "full_numbers",
    "columns": [
      {data: 'first_name'},
      {data: 'last_name'},
      {data: 'date_of_birth'},
      {data: 'staff_evaluation_date'},
      {data: 'id_expiration_date'},
      {data: 'work_authorization_expiration'},
      {data: 'safety_training_date'},
      {data: 'actions'},
    ],
    // optional, if you want full pagination controls.
    // Check dataTables documentation to learn more about
    // available options.
  });
});