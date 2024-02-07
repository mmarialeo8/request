
function BindDropdown(result, ControlId, ValueField, TextField, selectText, selectedValue) {
    var optionhtml = null;
    $(ControlId).find('option').remove();
    optionhtml = '<option value="">' + selectText + '</option>';
    $(ControlId).append(optionhtml);
    for (var i = 0; i < result.length; i++) {
        var selectedTextValue = '';
        if (selectedValue == result[i][ValueField]) {
            selectedTextValue = 'selected';
        }
        optionhtml = '<option value="' + result[i][ValueField] + '" ' + selectedTextValue + '>' + result[i][TextField] + '</option>';
        $(ControlId).append(optionhtml);
    }
}

function BindRequestCategory(requestCategoryControl, requestCategoryId) {
    $.ajax({
        url: '/master/master-data',
        type: "GET",
        dataType: 'json',
        data: {
            tableName: '[dbo].[RepairCategory]',
            columnIdName: 'RepairCategoryId',
            columnValueName: 'RepairCategory'
        },
        success: function (result) {
            if (result.isTransactionDone) {
                BindDropdown(result.data, requestCategoryControl, 'columnId', 'columnValue', ' Request Category ', requestCategoryId)
            }
            else {
                alert(result.transactionMessage)
            }
        },
        error: function (xhr, status) {
            showToasterMessage(status);
        }
    });
}

function BindBussinessType(bussinessTypeControl, bussinessTypeId) {
    $.ajax({
        url: '/master/master-data',
        type: "GET",
        dataType: 'json',
        data: {
            tableName: '[dbo].[BusinessType]',
            columnIdName: 'BusinessTypeId',
            columnValueName: 'BusinessType'
        },
        success: function (result) {
            if (result.isTransactionDone) {
                BindDropdown(result.data, bussinessTypeControl, 'columnId', 'columnValue', ' Business Type ', bussinessTypeId)
            }
            else {
                alert(result.transactionMessage)
            }
        },
        error: function (xhr, status) {
            showToasterMessage(status);
        }
    });
}

function BindRequestSource(requestSourceControl, requestSourceId) {
    $.ajax({
        url: '/master/master-data',
        type: "GET",
        dataType: 'json',
        data: {
            tableName: '[dbo].[RequestorSource]',
            columnIdName: 'RequestorSourceId',
            columnValueName: 'RequestorSource'
        },
        success: function (result) {
            if (result.isTransactionDone) {
                BindDropdown(result.data, requestSourceControl, 'columnId', 'columnValue', ' Request Source ', requestSourceId)
            }
            else {
                alert(result.transactionMessage)
            }
        },
        error: function (xhr, status) {
            showToasterMessage(status);
        }
    });
}

function BindRepairLocation(repairLocationControl, repairLocationId) {
    $.ajax({
        url: '/master/master-data',
        type: "GET",
        dataType: 'json',
        data: {
            tableName: '[dbo].[RepairLocation]',
            columnIdName: 'RepairLocationId',
            columnValueName: 'RepairLocation'
        },
        success: function (result) {
            if (result.isTransactionDone) {
                BindDropdown(result.data, repairLocationControl, 'columnId', 'columnValue', ' Repair Site ', repairLocationId)
            }
            else {
                alert(result.transactionMessage)
            }
        },
        error: function (xhr, status) {
            showToasterMessage(status);
        }
    });
}

function BindCustomerLocation(customerLocationControl, customerLocationId) {
    $.ajax({
        url: '/master/master-data',
        type: "GET",
        dataType: 'json',
        data: {
            tableName: '[dbo].[CustomerLocations]',
            columnIdName: 'CustomerLocationId',
            columnValueName: 'CustomerLocations'
        },
        success: function (result) {
            if (result.isTransactionDone) {
                BindDropdown(result.data, customerLocationControl, 'columnId', 'columnValue', ' Customer Location ', customerLocationId)
            }
            else {
                alert(result.transactionMessage)
            }
        },
        error: function (xhr, status) {
            showToasterMessage(status);
        }
    });
}

function BindBuName(buNameControl, buNameId) {
    $.ajax({
        url: '/master/master-data',
        type: "GET",
        dataType: 'json',
        data: {
            tableName: '[dbo].[BUNames]',
            columnIdName: 'BUNameId',
            columnValueName: 'BUName'
        },
        success: function (result) {
            if (result.isTransactionDone) {
                BindDropdown(result.data, buNameControl, 'columnId', 'columnValue', ' BU Name', buNameId)
            }
            else {
                alert(result.transactionMessage)
            }
        },
        error: function (xhr, status) {
            showToasterMessage(status);
        }
    });
}


//function formValidate(formControl) {
//    return validator.checkAll($(formControl))
//}

function getTodayDate() {
    var fullDate = new Date();
    //convert month to 2 digits
    var twoDigitDay = ((fullDate.getDate().toString().length === 2) ? (fullDate.getDate()) : '0' + (fullDate.getDate()));
    var twoDigitMonth = (((fullDate.getMonth() + 1).toString().length === 2) ? (fullDate.getMonth() + 1) : '0' + (fullDate.getMonth() + 1));
    var currentDate = twoDigitDay + "/" + twoDigitMonth + "/" + fullDate.getFullYear();
    return currentDate;
}





