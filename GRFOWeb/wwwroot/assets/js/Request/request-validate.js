var page = function () {

    init = function () {
        var frmNewsLetter = $('#frmNewsLetter'),
            select = $('.select2');
        // select2
        select.each(function () {
            var $this = $(this);
            $this.wrap('<div class="position-relative select-error"></div>');
            $this
                .select2({
                    placeholder: 'Select',
                    dropdownParent: $this.parent()
                })
                .change(function () {
                    $(this).valid();
                });
        });

        //custom validation rule
        $.validator.addMethod("customemail",
            function (value, element) {
                return /^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/.test(value);
            },
            "Please enter a valid email address."
        );


        if (frmNewsLetter.length) {
            frmNewsLetter.validate({
                errorElement: 'span', //default input error message container
                errorClass: 'help-block help-block-error', // default input error message class

                onkeyup: function (element) { $(element).valid() },
                highlight: function (element) { // hightlight error inputs
                    $(element)
                        .closest('.form-group').removeClass('has-success').addClass('has-error'); // set error class to the control group
                },
                unhighlight: function (element) { // revert the change done by hightlight
                    $(element)
                        .closest('.form-group').removeClass('has-error'); // set error class to the control group
                },
                success: function (label) {
                    label
                        .addClass('valid') // mark the current input as valid and display OK icon
                        .closest('.form-group').removeClass('has-error');//.addClass('has-success'); // set success class to the control group
                },

                rules: {

                    Name: {
                        required: true
                    },
                    Email: {
                        required: true
                    }
                }
            });
        }
    }
    return {
        init: init
    };
}();
