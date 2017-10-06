function initializeDataTable(tableId, columns, onTurbolinksLoadCallback) {
  var clientTableLoaded = false;
  var x = null;
  jQuery(document).on('turbolinks:load', function () {
    // $(tableId).on('init.dt', function () {
    //   clientTableLoaded = true;
    // });

    if (typeof onTurbolinksLoadCallback === 'function') {
      onTurbolinksLoadCallback();
    }

    $(tableId).DataTable({
      "processing": true,
      "serverSide": true,
      "ajax": $(tableId).data('source'),
      "pagingType": "full_numbers",
      "columns": columns,
    });
  });
}