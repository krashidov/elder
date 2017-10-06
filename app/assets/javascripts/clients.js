// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

initializeDataTable('#clients-table', [
  { data: 'first_name' },
  { data: 'last_name' },
  { data: 'date_of_birth' },
  { data: 'par_expiration' },
  { data: 'actions', bSortable: false },
]);
