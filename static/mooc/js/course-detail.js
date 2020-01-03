$(function () {

    //show course detail
    $(".rc-tabs-nav>div>div:first-child").click(function () {

        $(this).addClass("rc-tabs-tab-active");
        $(this).attr("aria-selected", "true");
        $(".rc-tabs-ink-bar-animated").css("transform", "translate3d(0px, 0px, 0px)");
        $(this).siblings().removeClass("rc-tabs-tab-active");
        $(this).siblings().attr("aria-selected", "false");

        $(".rc-tabs-content>div:first-child").attr("aria-hidden", "false");
        $(".rc-tabs-content>div:first-child").addClass("rc-tabs-tabpane-active");
        $(".rc-tabs-content>div:first-child").removeClass("rc-tabs-tabpane-inactive");
        $(".rc-tabs-content>div:first-child").siblings().attr("aria-hidden", "true");
        $(".rc-tabs-content>div:first-child").siblings().addClass("rc-tabs-tabpane-inactive");
        $(".rc-tabs-content>div:first-child").siblings().removeClass("rc-tabs-tabpane-active");

    })

    //show course video list
    $(".rc-tabs-nav>div>div").eq(1).click(function () {

        $(this).addClass("rc-tabs-tab-active");
        $(this).attr("aria-selected", "true");
        $(".rc-tabs-ink-bar-animated").css("transform", "translate3d(86px, 0px, 0px)");
        $(this).siblings().removeClass("rc-tabs-tab-active");
        $(this).siblings().attr("aria-selected", "false");

        $(".rc-tabs-content>div").eq(1).attr("aria-hidden", "false");
        $(".rc-tabs-content>div").eq(1).addClass("rc-tabs-tabpane-active");
        $(".rc-tabs-content>div").eq(1).removeClass("rc-tabs-tabpane-inactive");
        $(".rc-tabs-content>div").eq(1).siblings().attr("aria-hidden", "true");
        $(".rc-tabs-content>div").eq(1).siblings().addClass("rc-tabs-tabpane-inactive");
        $(".rc-tabs-content>div").eq(1).siblings().removeClass("rc-tabs-tabpane-active");

    })

    //show course comment
    $(".rc-tabs-nav>div>div").eq(2).click(function () {
        $(this).addClass("rc-tabs-tab-active");
        $(this).attr("aria-selected", "true");
        $(".rc-tabs-ink-bar-animated").css("transform", "translate3d(172px, 0px, 0px)");
        $(this).siblings().removeClass("rc-tabs-tab-active");
        $(this).siblings().attr("aria-selected", "false");

        $(".rc-tabs-content>div").eq(2).attr("aria-hidden", "false");
        $(".rc-tabs-content>div").eq(2).addClass("rc-tabs-tabpane-active");
        $(".rc-tabs-content>div").eq(2).removeClass("rc-tabs-tabpane-inactive");
        $(".rc-tabs-content>div").eq(2).siblings().attr("aria-hidden", "true");
        $(".rc-tabs-content>div").eq(2).siblings().addClass("rc-tabs-tabpane-inactive");
        $(".rc-tabs-content>div").eq(2).siblings().removeClass("rc-tabs-tabpane-active");
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


})