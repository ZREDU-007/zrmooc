$(function () {

    //click right register button to show register page
    $(".Mb0wI").click(function () {

        $("#LOGIN_FRAME").attr("src", $(this).attr("data-url"));
        $("#LOGIN_FRAME").attr("height", "470px");
        $(".loginMask").css("display", "block");
        $(".loginIframeContainer").css("display", "block");

    })

    //click right login button to show login page
    $("._320Oc").click(function () {

        $("#LOGIN_FRAME").attr("src", $(this).attr("data-url"));
        $("#LOGIN_FRAME").attr("height", "498px");
        $(".loginMask").css("display", "block");
        $(".loginIframeContainer").css("display", "block");


    })

    //click up login button to show login page
    $("._3mYds a:first-child").click(function () {

        $("#LOGIN_FRAME").attr("src", $(this).attr("data-url"));
        $("#LOGIN_FRAME").attr("height", "498px");
        $(".loginMask").css("display", "block");
        $(".loginIframeContainer").css("display", "block");

    })

    //click up register button to show register page
    $("._3mYds a:last-child").click(function () {

        $("#LOGIN_FRAME").attr("src", $(this).attr("data-url"));
        $("#LOGIN_FRAME").attr("height", "470px");
        $(".loginMask").css("display", "block");
        $(".loginIframeContainer").css("display", "block");

    })

    //left category show or hide control
    $("._3VRn3>li").hover(function () {
        $(this).find("a").addClass("_1DyHV");
        var $i = $(this).index() + 1;
        $("._1T6u4>ul:not(:first)").css("display", "none");
        $("._1T6u4>ul").eq($i).css("display", "block");
    }, function () {
        $(this).find("a").removeClass("_1DyHV");
        var $i = $(this).index() + 1;
        $("._1T6u4>ul").eq($i).css("display", "none");
        $("._1T6u4>ul").eq($i).hover(function () {
            $("._1T6u4>ul:first-child a").eq($i - 1).addClass("_1DyHV");
            $("._1T6u4>ul").eq($i).css("display", "block");
        }, function () {
            $("._1T6u4>ul:first-child a").eq($i - 1).removeClass("_1DyHV");
            $("._1T6u4>ul").eq($i).css("display", "none");
        })

    })

    //get banner number
    $banner_num = $(".slick-slide").length;

    //set single banner width
    $(".slick-slide").css("width", $(document.body).width());

    //set whole banner width
    $(".slick-track").css("width", $banner_num * $(document.body).width());

    //timer change banner image
    function autoSlider() {

        //get tanslate3d's first value
        $t3d1 = $(".slick-track").css("transform").replace(/[^0-9\-,]/g, '').split(",")[4].substr(1);
        if ($t3d1 == "") {
            $t3d1 == 0;
        }
        $cpos = 0;
        //change banner image
        if ($t3d1 == $(document.body).width() * ($banner_num - 1)) {
            $nt3d1 = 0;
            $(".slick-track").css("transform", "translate3d(-" + $nt3d1 + "px,0px,0px)");
            $(".slick-track").css("transition", "-webkit-transform 500ms ease 0s");

        } else {

            $nt3d1 = Number($(document.body).width()) + Number($t3d1);
            //判断当前是第几个图片
            $cpos = Number($nt3d1) / Number($(document.body).width());
            $(".slick-track").css("transform", "translate3d(-" + $nt3d1 + "px,0px,0px)");
            $(".slick-track").css("transition", "-webkit-transform 500ms ease 0s");
        }

        //change inditor css
        $(".jK3Pt>li").removeClass("slick-active");
        $(".jK3Pt>li").eq($cpos).addClass("slick-active");

        //change banner image css
        $(".slick-slide").removeClass("slick-active slick-current");
        $(".slick-slide").attr("aria-hidden", 'true');
        $(".slick-slide").eq($cpos).addClass("slick-active slick-current");
        $(".slick-slide").eq($cpos).attr("aria-hidden", "false");

    }

    t = setInterval(autoSlider, 2000);

    //pre & next button hover timer control
    $(".slick-arrow").hover(function () {
        clearInterval(t);
    }, function () {
        t = setInterval(autoSlider, 2000);
    })

    //prev button
    $(".slick-prev").click(function () {

        //stop timer
        clearInterval(t);

        //get tanslate3d's first value
        $t3d1 = $(".slick-track").css("transform").replace(/[^0-9\-,]/g, '').split(",")[4].substr(1);

        if ($t3d1 == "") {
            $t3d1 == 0;
        }

        $cpos = 0;

        if ($t3d1 == 0) {

            $nt3d1 = $(document.body).width() * ($banner_num - 1);
            $cpos = $banner_num / 2 - 1;
            $(".slick-track").css("transform", "translate3d(-" + $nt3d1 + "px,0px,0px)");
            $(".slick-track").css("transition", "-webkit-transform 500ms ease 0s");

        } else {

            $nt3d1 = Number($t3d1) - Number($(document.body).width());
            $cpos = Number($nt3d1) / Number($(document.body).width());
            $(".slick-track").css("transform", "translate3d(-" + $nt3d1 + "px,0px,0px)");
            $(".slick-track").css("transition", "-webkit-transform 500ms ease 0s");

        }

        //change inditor css
        $(".jK3Pt>li").removeClass("slick-active");
        $(".jK3Pt>li").eq($cpos).addClass("slick-active");

        //change banner image css
        $(".slick-slide").removeClass("slick-active slick-current");
        $(".slick-slide").attr("aria-hidden", 'true');
        $(".slick-slide").eq($cpos).addClass("slick-active slick-current");
        $(".slick-slide").eq($cpos).attr("aria-hidden", "false");

        //start timer
        t = setInterval(autoSlider, 2000);

    })

    //next button
    $(".slick-next").click(function () {

        //stop timer
        clearInterval(t);
        //get tanslate3d's first value
        $t3d1 = $(".slick-track").css("transform").replace(/[^0-9\-,]/g, '').split(",")[4].substr(1);
        if ($t3d1 == "") {
            $t3d1 == 0;
        }

        $cpos = 0;

        //change banner image css
        if ($t3d1 == $(document.body).width() * ($banner_num - 1)) {
            $nt3d1 = 0;
            $(".slick-track").css("transform", "translate3d(-" + $nt3d1 + "px,0px,0px)");
            $(".slick-track").css("transition", "-webkit-transform 500ms ease 0s");

        } else {

            $nt3d1 = Number($(document.body).width()) + Number($t3d1);
            //判断当前是第几个图片
            $cpos = Number($nt3d1) / Number($(document.body).width());
            $(".slick-track").css("transform", "translate3d(-" + $nt3d1 + "px,0px,0px)");
            $(".slick-track").css("transition", "-webkit-transform 500ms ease 0s");
        }

        //change inditor css
        $(".jK3Pt>li").removeClass("slick-active");
        $(".jK3Pt>li").eq($cpos).addClass("slick-active");

        //change banner image css
        $(".slick-slide").removeClass("slick-active slick-current");
        $(".slick-slide").attr("aria-hidden", 'true');
        $(".slick-slide").eq($cpos).addClass("slick-active slick-current");
        $(".slick-slide").eq($cpos).attr("aria-hidden", "false");

        //start timer
        t = setInterval(autoSlider, 2000);

    })

    //click dot button
    $(".jK3Pt li").click(function () {

        //stop timer
        clearInterval(t);

        $cpos = $(this).index();

        //change banner image
        $nt3d1 = Number($(document.body).width()) * $cpos;
        $(".slick-track").css("transform", "translate3d(-" + $nt3d1 + "px,0px,0px)");
        $(".slick-track").css("transition", "-webkit-transform 500ms ease 0s");
        //change inditor css
        $(".jK3Pt>li").removeClass("slick-active");
        $(".jK3Pt>li").eq($cpos).addClass("slick-active");

        //change banner image css
        $(".slick-slide").removeClass("slick-active slick-current");
        $(".slick-slide").attr("aria-hidden", 'true');
        $(".slick-slide").eq($cpos).addClass("slick-active slick-current");
        $(".slick-slide").eq($cpos).attr("aria-hidden", "false");

        //start timer
        t = setInterval(autoSlider, 2000);
    })

    //click hot keywords to make the text to search input
    $(".W-BrV a").click(function () {
        $(".wzBJ6 input").val($(this).text());
        $(".wzBJ6 a").click();
    })

    //click search button to show search result
    $(".wzBJ6 a").click(function () {
        if ($(".wzBJ6 input").val() != '') {
            window.location.href = "http://" + window.location.host + "/course/list/?keywords=" + $(".wzBJ6 input").val();
        } else {
            $(".wzBJ6 input").focus();
        }
    })

    //scroll to top
    $('._1rbAc').click(function () {
        $('html,body').animate({scrollTop: '0px'}, 800);
    });

})