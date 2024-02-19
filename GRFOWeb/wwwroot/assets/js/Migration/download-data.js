
$(function () {
});

var download_data_events = function () {

    loadNonMigratedData = function () {

        $('#dtMigratedData').DataTable({
            "pageLength": 10,
            "destroy": true,
            "bProcessing": true,
            "bServerSide": false,
            "buttons": ["copy", "csv", "excel", "pdf", "print", "colvis"],
            'ajax': {
                url: 'migration/get-non-migrated-data-json',
                type: 'GET',
                data: {
                    requestId: $('#hdfLastRequestId').val()
                },
                dataSrc: "gpstData"
            },
            'columns': [
                { "data": "part_request_id" },
                { "data": "project_type" },
                { "data": "project_sub_type" },
                { "data": "grfo_comment_actions_summary" },
                { "data": "project_requestor" },
                { "data": "base_part_number" }
            ],
            'order': [0, 'asc'],
        });
    },
        downloadData = function (requestId) {
            $.ajax({
                url: '/migration/update-data',
                dataType: 'json',
                data: {
                    requestId: $('#hdfLastRequestId').val()
                },
                type: 'GET',
                success: function (result) {
                    if (result.isTransactionDone) {
                        showMessageStatus('Successfully Downloaded');                        
                        setTimeout(function () {
                            location.reload(true);
                        }, 2000);
                    }
                },
                error: function (xhr, status) {
                    alert(status);
                }
            });
        }
    return {
        loadNonMigratedData: loadNonMigratedData,
        downloadData: downloadData
    }
}();
