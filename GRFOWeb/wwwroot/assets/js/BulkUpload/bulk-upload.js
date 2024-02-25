
$(function () {
});

var bulk_upload_events = function () {

    //loadNonMigratedData = function () {

    //    $('#dtMigratedData').DataTable({
    //        "pageLength": 10,
    //        "destroy": true,
    //        "bProcessing": true,
    //        "bServerSide": false,
    //        "buttons": ["copy", "csv", "excel", "pdf", "print", "colvis"],
    //        'ajax': {
    //            url: 'migration/get-non-migrated-data-json',
    //            type: 'GET',
    //            data: {
    //                requestId: $('#hdfLastRequestId').val()
    //            },
    //            dataSrc: "gpstData"
    //        },
    //        'columns': [
    //            { "data": "part_request_id" },
    //            { "data": "project_type" },
    //            { "data": "project_sub_type" },
    //            { "data": "grfo_comment_actions_summary" },
    //            { "data": "project_requestor" },
    //            { "data": "base_part_number" }
    //        ],
    //        'order': [0, 'asc'],
    //    });
    //},
    downloadTemplate = function (requestId) {
       
        alert(JSON.stringify({
            requestSource: $("#requestSourceId option:selected").text(),
            basePartNumber: $('#basePartNumbers').val(),
        }));

        $("#frmBulkUpload").validate({
            rules: {
                requestSourceId: "required",
                basePartNumbers: "required"                
            },
            messages: {
                requestSourceId: "Request source is required",
                basePartNumbers: "Base part numbers is required",             
            },
            errorElement: 'span',
            errorPlacement: function (error, element) {
                error.addClass('invalid-feedback');
                element.closest('.form-group').append(error);
            },
            highlight: function (element, errorClass, validClass) {
                $(element).addClass('is-invalid');
            },
            unhighlight: function (element, errorClass, validClass) {
                $(element).removeClass('is-invalid');
            }
        });
        if ($("#frmBulkUpload").valid()) {            
            $.ajax({
                url: '/bulk-upload/donwload-template',                
                data: {
                    requestSource: $("#requestSourceId option:selected").text(),
                    basePartNumber: $('#basePartNumbers').val(),
                },
                method: 'GET',
                xhrFields: {
                    responseType: 'blob'
                },
                success: function (result) {
                    // Create a temporary anchor element
                    var downloadLink = document.createElement('a');
                    var blob = new Blob([result], { type: 'application/octet-stream' });
                    var url = window.URL.createObjectURL(blob);

                    // Set the href attribute of the anchor element to the Object URL
                    downloadLink.href = url;

                    // Set the download attribute to specify the filename
                    downloadLink.download = 'Request_Master.xlsx';

                    // Click the anchor element programmatically to trigger the download
                    downloadLink.click();

                    // Cleanup
                    window.URL.revokeObjectURL(url);
                },
                error: function (xhr, status) {
                    console.error('Error downloading file:', error);
                }
            });
        }

            
        }
    return {
        //loadNonMigratedData: loadNonMigratedData,
        downloadTemplate: downloadTemplate
    }
}();
