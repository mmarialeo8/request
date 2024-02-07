$(function () {



});

var request_events = function () {

    loadRequest = function () {

        $('#dtRequest').DataTable({
            "pageLength": 10,
            "destroy": true,
            "bProcessing": true,
            "bServerSide": false,
            "buttons": ["copy", "csv", "excel", "pdf", "print", "colvis"],
            'ajax': {
                url: '/request/json',
                type: 'GET',
                dataSrc: "request"
            },
            'columns': [
                { "data": "requestId" },
                { "data": "requestorSource" },
                { "data": "repairCategory" },
                { "data": "businessType" },
                { "data": "basePartNumber" },
                { "data": "partDescription" },
                { "data": "screeningStatus" },
                { "data": "businessCaseStatus" },
                { "data": "pilotReviewStatus" },
                { "data": "prdImplementation" },
                { "data": "t1CustomerQty" },
                { "data": "needByDate" }
            ],

            'columnDefs': [
                {
                    'targets': 12,
                    'searchable': false,
                    'orderable': false,
                    'width': '1%',
                    'data': 'requestId',
                    'className': 'dt-body-center',
                    'render': function (data, type, JsonResultRow, meta) {
                        return "<a href='javascript:void(0);' class='text-warning' onclick='request_events.editRequest(" + JsonResultRow.requestId + ")' title='Click here to edit record'><i class='fa fa-pen'></i></a>" +
                            //"<a href='javascript:void(0);' class='text-danger' onclick='request_events.deleteRequest(" + JsonResultRow.requestId + ")' title='Click here to delete record'><i class='fa fa-trash'></i></a>" +
                            "<a href='javascript:void(0);' class='text-info' onclick='request_events.viewRequest(" + JsonResultRow.requestId + ")' title='Click here to update status'><i class='fa fa-eye'></i></a>" +
                            "<a href='javascript:void(0);' class='text-secondary' onclick='request_events.viewRequest(" + JsonResultRow.requestId + ")' title='Click here to update status'><i class='fa fa-info-circle'></i></a>"
                    }
                }
            ],

            'order': [1, 'asc'],
        });

    },
        addRequest = function () {
            $.ajax({
                url: '/request/add',
                contentType: 'application/html; charset=utf-8',
                type: 'GET',
                dataType: 'html',
                success: function (result) {
                    $('#divcontent').empty();
                    $('#divcontent').html(result);
                    $('#staticBackdrop').modal('show');


                    $('[data-mask]').inputmask();

                    BindRequestCategory('#requestCategoryId', $('#hdfrequestCategoryId').val());

                    BindBussinessType('#businessTypeId', $('#hdfbusinessTypeId').val());

                    BindRequestSource('#requestSourceId', $('#hdfrequestSourceId').val());

                    BindRepairLocation('#repairLocationId', $('#hdfrepairLocationId').val());

                    BindCustomerLocation('#customerLocationId', $('#hdfcustomerLocationId').val());

                    BindBuName('#buNameId', $('#hdfcustomerLocationId').val());


                    //$('#frmRequestDetails')
                    //    .on('blur', 'input[required], input.optional, select.required', validator.checkField)
                    //    .on('change', 'select.required', validator.checkField)
                    //    .on('keypress', 'input[required][pattern]', validator.keypress);

                },
                error: function (xhr, status) {
                    alert(status);
                }
            });
        },
        onBasePartNumberChange = function (e) {
            $.ajax({
                url: '/request/load-hadoop-data',
                contentType: 'application/html; charset=utf-8',
                data: {
                    basePartNumber: $("#basePartNumber").val()
                },
                type: 'GET',
                dataType: 'html',
                success: function (result) {
                    $('#divBasePartNumber').empty();
                    $('#divBasePartNumber').html(result);
                },
                error: function (xhr, status) {
                    alert(status);
                }
            });
            onBussinessTypeChange();
        },

        onBussinessTypeChange = function () {
            var bussinessType = $("#businessTypeId option:selected").text();
            var basePartNumber = $('#basePartNumber').val();
            var solutionPartNumber = $('#solutionPartNumber').val();

            if (bussinessType == "BtoW") {
                $('#solutionPartNumber').val(basePartNumber + 'W');
            }

            else if (bussinessType == "CPR") {
                $('#solutionPartNumber').val(basePartNumber + 'R');
            }
            else if (bussinessType == "VU") {
                $('#solutionPartNumber').val(basePartNumber + 'VU');
            }

            //else if (bussinessType == "TKM") {
            //    if (!solutionPartNumber.match("^0247")) {
            //        alert('Invalid Solution part number')
            //    }
            //}
            //else if (bussinessType == "6K") {
            //    if (!solutionPartNumber.match("^6000")) {
            //        alert('Invalid Solution part number')
            //    }
            //}
            else
                $('#solutionPartNumber').val('');

            onSolutionPartNumberChange();
        },
        onSolutionPartNumberChange = function () {
            var bussinessType = $("#businessTypeId option:selected").text();
            var solutionPartNumber = $('#solutionPartNumber').val();

            if (bussinessType == "TKM") {
                if (!solutionPartNumber.match("^0247")) {
                    alert('Invalid Solution part number')
                }
            }
            else if (bussinessType == "6K") {
                if (!solutionPartNumber.match("^6000")) {
                    alert('Invalid Solution part number')
                }
            }


        },
        editRequest = function (requestId) {
            $.ajax({
                url: '/request/edit',
                contentType: 'application/html; charset=utf-8',
                data: {
                    requestId: requestId
                },
                type: 'GET',
                dataType: 'html',
                success: function (result) {
                    $('#divcontent').empty();
                    $('#divcontent').html(result);
                    $('#staticBackdrop').modal('show');

                    BindRequestCategory('#requestCategoryId', $('#hdfrequestCategoryId').val());

                    BindBussinessType('#businessTypeId', $('#hdfbusinessTypeId').val());

                    BindRequestSource('#requestSourceId', $('#hdfrequestSourceId').val());

                    BindRepairLocation('#repairLocationId', $('#hdfrepairLocationId').val());

                    BindCustomerLocation('#customerLocationId', $('#hdfcustomerLocationId').val());

                    BindBuName('#buNameId', $('#hdfcustomerLocationId').val());


                    $('[data-mask]').inputmask();

                    //$('#needByDate').datetimepicker({
                    //    format: 'DD/MM/YYYY'
                    //});

                    //$('#prdDate').datetimepicker({
                    //    format: 'DD/MM/YYYY'
                    //});

                    //$('#frmRequestDetails')
                    //    .on('blur', 'input[required], input.optional, select.required', validator.checkField)
                    //    .on('change', 'select.required', validator.checkField)
                    //    .on('keypress', 'input[required][pattern]', validator.keypress);

                    // requestSourceChange();

                },
                error: function (xhr, status) {
                    alert(status);
                }
            });
        },
        viewRequest = function (requestId) {
            $.ajax({
                url: '/request/view',
                contentType: 'application/html; charset=utf-8',
                data: {
                    requestId: requestId
                },
                type: 'GET',
                dataType: 'html',
                success: function (result) {
                    $('#divcontent').empty();
                    $('#divcontent').html(result);
                    $('#staticBackdrop').modal('show');

                    BindRequestCategory('#requestCategoryId', $('#hdfrequestCategoryId').val());

                    BindBussinessType('#businessTypeId', $('#hdfbusinessTypeId').val());

                    BindRequestSource('#requestSourceId', $('#hdfrequestSourceId').val());

                    BindRepairLocation('#repairLocationId', $('#hdfrepairLocationId').val());

                    BindCustomerLocation('#customerLocationId', $('#hdfcustomerLocationId').val());

                    BindBuName('#buNameId', $('#hdfcustomerLocationId').val());

                    $('#prdDate').datetimepicker({
                        format: 'DD/MM/YYYY'
                    });
                },
                error: function (xhr, status) {
                    alert(status);
                }
            });
        },
        requestSourceChange = function () {

            $("#divExectiveName").css("display", "none")
            $("#divCCNumber").css("display", "none")
            $("#divGRFOComment").css("display", "none")

            if ($("#requestSourceId").val() == 2) {
                $("#divExectiveName").css("display", "")
            }
            if ($("#requestSourceId").val() == 3) {
                $("#divCCNumber").css("display", "")
            }
            if ($("#requestSourceId").val() == 4) {
                $("#divGRFOComment").css("display", "")
            }
        },
        saveRequest = function () {
            var data = {
                requestId: $("#requestId").val(),
                requestCategoryId: $("#requestCategoryId").val(),
                businessTypeId: $("#businessTypeId").val(),
                requestSourceId: $("#requestSourceId").val(),

                exectiveName: $("#exectiveName").val(),
                ccNumber: $("#ccNumber").val(),
                grfoComment: $("#grfoComment").val(),

                requestorProjectGroup: $("#requestorProjectGroup").val(),
                requestor: $("#requestor").val(),
                basePartNumber: $("#basePartNumber").val(),
                solutionPartNumber: $("#solutionPartNumber").val(),
                needByDate: $("#needByDate").val(),
                buNameId: $("#buNameId").val(),
                repairLocationId: $("#repairLocationId").val(),
                targetCustomer: $("#targetCustomer").val(),
                customerLocationId: $("#customerLocationId").val(),
                annualRepairForecast1: $("#annualRepairForecast1").val(),
                annualRepairForecast2: $("#annualRepairForecast2").val(),
                comments: $("#comments").val(),
                partDescription: $("#partDescription").val(),
                stdCostBasePart: $("#stdCostBasePart").val(),
                annualRepairForecast: $("#annualRepairForecast").val(),
                extendedSpendPotential: $("#extendedSpendPotential").val(),
                t1CustomerQty: $("#t1CustomerQty").val(),
                t2CustomerQty: $("#t2CustomerQty").val(),
                mg3: $("#mg3").val(),
                prdImplementation: $("#prdImplementation").prop("checked"),
                prdDate: $("#prdDate").val(),
            }

            $("#frmRequestDetails").validate({
                rules: {
                    requestCategoryId: "required",
                    businessTypeId: "required",
                    requestSourceId: "required",
                    exectiveName: "required",
                    ccNumber: "required",
                    grfoComment: "required",
                    requestorProjectGroup: "required",
                    requestor: "required",
                    basePartNumber: "required",
                    solutionPartNumber: "required",
                    needByDate: "required",
                    buNameId: "required",
                    repairLocationId: "required",
                    targetCustomer: "required",
                    customerLocationId: "required",
                    annualRepairForecast1: "required",
                    annualRepairForecast2: "required",
                    comments: "required",
                    partDescription: "required",
                    stdCostBasePart: "required",
                    annualRepairForecast: "required",
                    extendedSpendPotential: "required",
                    t1CustomerQty: "required",
                    t2CustomerQty: "required",
                    mg3: "required",
                },
                messages: {
                    requestCategoryId: "Request category is required",
                    businessTypeId: "Business type is required",
                    requestSourceId: "Request source is required",
                    exectiveName: "Exective name is required",
                    ccNumber: "CC Number is required",
                    grfoComment: "GRFO Comment is required",
                    requestorProjectGroup: "Requestor project group is required",
                    requestor: "Requestor is required",
                    basePartNumber: "Base part number is required",
                    solutionPartNumber: "Solution part number is required",
                    needByDate: "Need by date is required",
                    buNameId: "Bu name is required",
                    repairLocationId: "Repair location is required",
                    targetCustomer: "Target customer is required",
                    customerLocationId: "Customer location is required",
                    annualRepairForecast1: "Annual repair forecast 1 is required",
                    annualRepairForecast2: "Annual repair forecast 2 is required",
                    comments: "Comments is required",
                    partDescription: "Part description is required",
                    stdCostBasePart: "STD cost base part is required",
                    annualRepairForecast: "Annual repair forecast is required",
                    extendedSpendPotential: "Extended spend potential is required",
                    t1CustomerQty: "T1 Customer Qty is required",
                    t2CustomerQty: "T2 Customer Qty is required",
                    mg3: "mg3 is required",
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

            if ($("#frmRequestDetails").valid()) {
                $.ajax({
                    url: '/request/save',
                    type: 'POST',
                    dataType: 'json',
                    data: { data: data },
                    success: function (result) {
                        showMessageStatus(result.transactionMessage);
                        if (result.isTransactionDone) {
                            $('#staticBackdrop').modal('hide');
                            loadRequest();
                        }
                    },
                    error: function (xhr, status) {
                        showMessageStatus(status);
                    }
                });
            }
        },
        updateRequest = function () {
            var data = {
                requestId: $("#requestId").val(),
                screeningStatus: $("#screeningStatus").val(),
                businessCaseStatus: $("#businessCaseStatus").val(),
                pilotReviewStatus: $("#pilotReviewStatus").val(),
                prdImplementation: $("#prdImplementation").prop("checked"),
                prdDate: $("#prdDate").val(),
            }

            $("#frmRequestDetails").validate({
                rules: {
                    screeningStatus: "required",
                    businessCaseStatus: "required",
                    pilotReviewStatus: "required",
                    prdImplementation: "required",
                    prdDate: "required"
                },
                messages: {
                    screeningStatus: "Request category is required",
                    businessCaseStatus: "Business type is required",
                    pilotReviewStatus: "Request source is required",
                    prdImplementation: "Exective name is required",
                    prdDate: "CC Number is required",
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


            if ($("#frmRequestDetails").valid()) {
                $.ajax({
                    url: '/request/update',
                    type: 'POST',
                    dataType: 'json',
                    data: { data: data },
                    success: function (result) {
                        showMessageStatus(result.transactionMessage);
                        if (result.isTransactionDone) {
                            $('#staticBackdrop').modal('hide');
                            loadRequest();
                        }
                    },
                    error: function (xhr, status) {
                        alert(result.transactionMessage)                        
                    }
                });
            }
        },
        downloadData = function () {
            $.ajax({
                url: '/request/download-data',
                type: "GET",
                dataType: 'json',
                data: {},
                success: function (result) {
                },
                error: function (xhr, status) {
                    //showToasterMessage(status);
                }
            });
        }
    return {
        loadRequest: loadRequest,
        addRequest: addRequest,
        onBasePartNumberChange: onBasePartNumberChange,
        editRequest: editRequest,
        viewRequest: viewRequest,
        saveRequest: saveRequest,
        updateRequest: updateRequest,
        requestSourceChange: requestSourceChange,
        downloadData: downloadData,
        onBussinessTypeChange: onBussinessTypeChange,
        onSolutionPartNumberChange: onSolutionPartNumberChange
    }
}();
