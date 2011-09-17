$(function() {
    $('#search_order_state').live('change', function() {
        //alert('Handler for .change() called.');
        //this.form.submit();
        //$.getScript(this.href);
        //return false;
    });

    $("tbody tr").hover(
        function () {
            $(this).css("background", "#FFFF99");

        },
        function () {
            $(this).css("background", "");
        }
    );

    $('#btn-submit').click(function() {
//        document.forms[0].submit();
        $('#new_manufacture_form').submit();
        $.fancybox.close();
        return false;
    });

    $('#product_pump_id').click(function() {
        return false;
    });

    //-----------------------------------------------------------------------------------------
    //- FancyBox New Window For Cut
    //-----------------------------------------------------------------------------------------
    $("a#new_cut").fancybox({
        'width'                : 300,
        'height'            : 140,
        'autoScale'            : true,
        'transitionIn'        : 'none',
        'transitionOut'        : 'none',
        'type'                : 'iframe',
        'scrolling'            : 'no',
        'title'            : 'เพิ่มชนิดการตัด',
        'onClosed': function() {
            $.ajax({
                dataType: "json",
                cache: false,
                url: "/cuts",
                timeout: 2000,
                error: function(XMLHttpRequest, errorTextStatus, error) {
                    alert("Failed to submit : " + errorTextStatus + " ;" + error);
                },
                success: function(data) {
                    $("select#product_cut_id option").remove();
                    var row = "<option value=\"" + "" + "\">" + "" + "</option>";
                    $(row).appendTo("select#product_cut_id");
                    $.each(data, function(i, j) {
                        row = "<option value=\"" + j.cut.id + "\">" + j.cut.name + "</option>";
                        $(row).appendTo("select#product_cut_id");
                    });
                }
            });
        }
    });

    $("#form_new_cut").bind("submit", function() {
        alert("xx");
        $.fancybox.showActivity();

        $.ajax({
            type        : "POST",
            cache    : false,
            url        : "/data/login.php",
            data        : $(this).serializeArray(),
            success: function(data) {
                $.fancybox(data);
            }
        });

        return false;
    });

    //-----------------------------------------------------------------------------------------
    //- FancyBox New Window For Coat
    //-----------------------------------------------------------------------------------------
    $("a#new_coat").fancybox({
        'width'                : 300,
        'height'            : 140,
        'autoScale'            : true,
        'transitionIn'        : 'none',
        'transitionOut'        : 'none',
        'type'                : 'iframe',
        'scrolling'            : 'no',
        'title'            : 'เพิ่มชนิดการเคลือบ',
        'onClosed': function() {
            $.ajax({
                dataType: "json",
                cache: false,
                url: "/coats",
                timeout: 2000,
                error: function(XMLHttpRequest, errorTextStatus, error) {
                    alert("Failed to submit : " + errorTextStatus + " ;" + error);
                },
                success: function(data) {
                    $("select#product_coat_id option").remove();
                    var row = "<option value=\"" + "" + "\">" + "" + "</option>";
                    $(row).appendTo("select#product_coat_id");
                    $.each(data, function(i, j) {
                        row = "<option value=\"" + j.coat.id + "\">" + j.coat.name + "</option>";
                        $(row).appendTo("select#product_coat_id");
                    });
                }
            });
        }
    });
    //-----------------------------------------------------------------------------------------
    //- FancyBox New Window For Pump
    //-----------------------------------------------------------------------------------------
    $("a#new_pump").fancybox({
        'width'                : 300,
        'height'            : 140,
        'autoScale'            : true,
        'transitionIn'        : 'none',
        'transitionOut'        : 'none',
        'type'                : 'iframe',
        'scrolling'            : 'no',
        'title'            : 'เพิ่มชนิดการปั้มพิเศษ',
        'onClosed': function() {
            $.ajax({
                dataType: "json",
                cache: false,
                url: "/pumps",
                timeout: 2000,
                error: function(XMLHttpRequest, errorTextStatus, error) {
                    alert("Failed to submit : " + errorTextStatus + " ;" + error);
                },
                success: function(data) {
                    $("select#product_pump_id option").remove();
                    var row = "<option value=\"" + "" + "\">" + "" + "</option>";
                    $(row).appendTo("select#product_pump_id");
                    $.each(data, function(i, j) {
                        row = "<option value=\"" + j.pump.id + "\">" + j.pump.name + "</option>";
                        $(row).appendTo("select#product_pump_id");
                    });
                }
            });
        }
    });

    //-----------------------------------------------------------------------------------------
    //- FancyBox New Window For Pump Line
    //-----------------------------------------------------------------------------------------
    $("a#new_pump_line").fancybox({
        'width'                : 300,
        'height'            : 140,
        'autoScale'            : true,
        'transitionIn'        : 'none',
        'transitionOut'        : 'none',
        'type'                : 'iframe',
        'scrolling'            : 'no',
        'title'            : 'เพิ่มชนิดการปั้มเส้นผับ',
        'onClosed': function() {
            $.ajax({
                dataType: "json",
                cache: false,
                url: "/pump_lines",
                timeout: 2000,
                error: function(XMLHttpRequest, errorTextStatus, error) {
                    alert("Failed to submit : " + errorTextStatus + " ;" + error);
                },
                success: function(data) {
                    $("select#product_pump_line_id option").remove();
                    var row = "<option value=\"" + "" + "\">" + "" + "</option>";
                    $(row).appendTo("select#product_pump_line_id");
                    $.each(data, function(i, j) {
                        row = "<option value=\"" + j.pump_line.id + "\">" + j.pump_line.name + "</option>";
                        $(row).appendTo("select#product_pump_line_id");
                    });
                }
            });
        }
    });

    //-----------------------------------------------------------------------------------------
    //- FancyBox New Window For Mouth
    //-----------------------------------------------------------------------------------------
    $("a#new_mouth").fancybox({
        'width'                : 300,
        'height'            : 140,
        'autoScale'            : true,
        'transitionIn'        : 'none',
        'transitionOut'        : 'none',
        'type'                : 'iframe',
        'scrolling'            : 'no',
        'title'            : 'เพิ่มขนาดปากถุง',
        'onClosed': function() {
            $.ajax({
                dataType: "json",
                cache: false,
                url: "/mouths",
                timeout: 2000,
                error: function(XMLHttpRequest, errorTextStatus, error) {
                    alert("Failed to submit : " + errorTextStatus + " ;" + error);
                },
                success: function(data) {
                    $("select#product_mouth_id option").remove();
                    var row = "<option value=\"" + "" + "\">" + "" + "</option>";
                    $(row).appendTo("select#product_mouth_id");
                    $.each(data, function(i, j) {
                        row = "<option value=\"" + j.mouth.id + "\">" + j.mouth.name + "</option>";
                        $(row).appendTo("select#product_mouth_id");
                    });
                }
            });
        }
    });

    //-----------------------------------------------------------------------------------------
    //- FancyBox New Window For Mouth
    //-----------------------------------------------------------------------------------------
    $("a#new_glue").fancybox({
        'width'                : 300,
        'height'            : 140,
        'autoScale'            : true,
        'transitionIn'        : 'none',
        'transitionOut'        : 'none',
        'type'                : 'iframe',
        'scrolling'            : 'no',
        'title'            : 'เพิ่มชนิดติดกาว',
        'onClosed': function() {
            $.ajax({
                dataType: "json",
                cache: false,
                url: "/glues",
                timeout: 2000,
                error: function(XMLHttpRequest, errorTextStatus, error) {
                    alert("Failed to submit : " + errorTextStatus + " ;" + error);
                },
                success: function(data) {
                    $("select#product_glue_id option").remove();
                    var row = "<option value=\"" + "" + "\">" + "" + "</option>";
                    $(row).appendTo("select#product_glue_id");
                    $.each(data, function(i, j) {
                        row = "<option value=\"" + j.glue.id + "\">" + j.glue.name + "</option>";
                        $(row).appendTo("select#product_glue_id");
                    });
                }
            });
        }
    });


    $("select#order_customer_id").change(function() {
        var id_value_string = $(this).val();
        if (id_value_string == "") {
            // if the id is empty remove all the sub_selection options from being selectable and do not do any ajax
            $("select#order_product_id option").remove();
            var row = "<option value=\"" + "" + "\">" + "" + "</option>";
            $(row).appendTo("select#order_product_id");
        }
        else {
            // Send the request and update sub category dropdown
            $.ajax({
                dataType: "json",
                cache: false,
                url: '/order/product/' + id_value_string + "/",
                timeout: 2000,
                error: function(XMLHttpRequest, errorTextStatus, error) {
                    alert("Failed to submit : " + errorTextStatus + " ;" + error);
                },
                success: function(data) {
                    // Clear all options from sub category select
                    $("select#order_product_id option").remove();
                    //put in a empty default line
                    var row = "<option value=\"" + "" + "\">" + "" + "</option>";
                    $(row).appendTo("select#order_product_id");
                    // Fill sub category select
                    $.each(data, function(i, j) {
                        row = "<option value=\"" + j.product.id + "\">" + j.product.name + "</option>";
                        $(row).appendTo("select#order_product_id");
                    });
                }
            });
        }
    });


    $('#menu').click(function() {
        $.fancybox.resize();
    });


});