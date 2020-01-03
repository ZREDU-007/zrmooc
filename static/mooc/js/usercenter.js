$(function () {

    //click nav to change tab content
    $(".rc-tabs-nav>div>div").click(function () {

        $(".rc-tabs-nav>div>div").attr("aria-selected", "false");
        $(".rc-tabs-nav>div>div").removeClass("rc-tabs-tab-active");
        $(".rc-tabs-content>div").attr("aria-hidden", "true");
        $(".rc-tabs-content>div").eq($(this).index()).attr("aria-hidden", "false");

        $(this).attr("aria-selected", "true");
        $(this).addClass("rc-tabs-tab-active");

        if ($(".rc-tabs-content>div").hasClass("rc-tabs-tabpane-active")) {
            $(".rc-tabs-content>div").removeClass("rc-tabs-tabpane-active");
            $(".rc-tabs-content>div").addClass("rc-tabs-tabpane-inactive");
        }
        $(".rc-tabs-content>div").eq($(this).index()).attr("aria-hidden", "false");
        $(".rc-tabs-content>div").eq($(this).index()).removeClass("rc-tabs-tabpane-inactive");
        $(".rc-tabs-content>div").eq($(this).index()).addClass("rc-tabs-tabpane-active");

        $(".rc-tabs-ink-bar").css("transform", "translate3d(" + $(this).index() * 126 + "px, 0px, 0px)");
    })

    //modify shotcut
    $("._2uLFV:first").click(function () {

        $(".rc-tabs-nav>div>div").attr("aria-selected", "false");
        $(".rc-tabs-nav>div>div").removeClass("rc-tabs-tab-active");
        $(".rc-tabs-content>div").attr("aria-hidden", "true");
        $(".rc-tabs-content>div").eq(1).attr("aria-hidden", "false");
        $(".rc-tabs-nav>div").eq(1).attr("aria-selected", "true");
        $(".rc-tabs-nav>div").eq(1).addClass("rc-tabs-tab-active");

        if ($(".rc-tabs-content>div").hasClass("rc-tabs-tabpane-active")) {
            $(".rc-tabs-content>div").removeClass("rc-tabs-tabpane-active");
            $(".rc-tabs-content>div").addClass("rc-tabs-tabpane-inactive");
        }
        $(".rc-tabs-content>div").eq(1).attr("aria-hidden", "false");
        $(".rc-tabs-content>div").eq(1).removeClass("rc-tabs-tabpane-inactive");
        $(".rc-tabs-content>div").eq(1).addClass("rc-tabs-tabpane-active");

        $(".rc-tabs-ink-bar").css("transform", "translate3d(" + 1 * 126 + "px, 0px, 0px)");
    })
    //modify shotcut
    $("._2uLFV:last").click(function () {

        $(".rc-tabs-nav>div>div").attr("aria-selected", "false");
        $(".rc-tabs-nav>div>div").removeClass("rc-tabs-tab-active");
        $(".rc-tabs-content>div").attr("aria-hidden", "true");
        $(".rc-tabs-content>div").eq(3).attr("aria-hidden", "false");
        $(".rc-tabs-nav>div").eq(3).attr("aria-selected", "true");
        $(".rc-tabs-nav>div").eq(3).addClass("rc-tabs-tab-active");

        if ($(".rc-tabs-content>div").hasClass("rc-tabs-tabpane-active")) {
            $(".rc-tabs-content>div").removeClass("rc-tabs-tabpane-active");
            $(".rc-tabs-content>div").addClass("rc-tabs-tabpane-inactive");
        }
        $(".rc-tabs-content>div").eq(3).attr("aria-hidden", "false");
        $(".rc-tabs-content>div").eq(3).removeClass("rc-tabs-tabpane-inactive");
        $(".rc-tabs-content>div").eq(3).addClass("rc-tabs-tabpane-active");

        $(".rc-tabs-ink-bar").css("transform", "translate3d(" + 3 * 126 + "px, 0px, 0px)");
    })
    //modify shotcut
    $("._2uLFV").eq(1).click(function () {

        $(".rc-tabs-nav>div>div").attr("aria-selected", "false");
        $(".rc-tabs-nav>div>div").removeClass("rc-tabs-tab-active");
        $(".rc-tabs-content>div").attr("aria-hidden", "true");
        $(".rc-tabs-content>div").eq(2).attr("aria-hidden", "false");
        $(".rc-tabs-nav>div").eq(2).attr("aria-selected", "true");
        $(".rc-tabs-nav>div").eq(2).addClass("rc-tabs-tab-active");

        if ($(".rc-tabs-content>div").hasClass("rc-tabs-tabpane-active")) {
            $(".rc-tabs-content>div").removeClass("rc-tabs-tabpane-active");
            $(".rc-tabs-content>div").addClass("rc-tabs-tabpane-inactive");
        }
        $(".rc-tabs-content>div").eq(2).attr("aria-hidden", "false");
        $(".rc-tabs-content>div").eq(2).removeClass("rc-tabs-tabpane-inactive");
        $(".rc-tabs-content>div").eq(2).addClass("rc-tabs-tabpane-active");

        $(".rc-tabs-ink-bar").css("transform", "translate3d(" + 2 * 126 + "px, 0px, 0px)");
    })

    //footer wechat & weibo icon hover to change img src
    $("._2DW2R a:first").hover(function () {
        $("._2DW2R a:first img:first").attr("src", "/static/mooc/image/footer_asubwb.png");
    }, function () {
        $("._2DW2R a:first img:first").attr("src", "/static/mooc/image/footer_subwb.png");
    })
    $("._2DW2R a:last").hover(function () {
        $("._2DW2R a:last img:first").attr("src", "/static/mooc/image/footer_asubwx.png");
    }, function () {
        $("._2DW2R a:last img:first").attr("src", "/static/mooc/image/footer_subwx.png");
    })

    //click search button to show search result
    $("._1j-ox a").click(function () {
        if ($("._1j-ox input").val() != '') {
            if (window.sessionStorage.getItem("degree_num") != '' && window.sessionStorage.getItem("degree_num") != null) {
                window.sessionStorage.removeItem("degree_num");
            }

            if (window.sessionStorage.getItem("vip_num") != '' && window.sessionStorage.getItem("vip_num") != null) {
                window.sessionStorage.removeItem("vip_num");
            }
            window.location.href = "http://" + window.location.host + "/course/list/?keywords=" + $("._1j-ox input").val();
        } else {
            $("._1j-ox input").focus();
        }
    })

    //user_msg
    $("._3HSzw").click(function () {
        $(".oh0MF").hide();
    })
    $("._3cI36").click(function () {
        $(".oh0MF").show();
    })

})