$(function () {

    //click up login button to show login page
    $("._3mYds a:first-child").click(function () {
        $("#LOGIN_FRAME").attr("src", $(this).attr("data-url"));
        $(".loginMask").css("display", "block");
        $(".loginIframeContainer").css("display", "block");

    })

    //click up register button to show register page
    $("._3mYds a:last-child").click(function () {
        $("#LOGIN_FRAME").attr("src", $(this).attr("data-url"));
        $(".loginMask").css("display", "block");
        $(".loginIframeContainer").css("display", "block");

    })

    //first page css change
    if ($(".ant-pagination-item-active a").text() == '1') {
        $(".aitemFirst").addClass("aitemDisatble");
        $(".aitemFirst").attr("disabled", "disabled");
    } else {
        $(".aitemFirst").removeClass("aitemDisatble");
        $(".aitemFirst").removeAttr("disabled");
    }
    //first page action control
    $(".aitemFirst").click(function () {
        //alert("test");
    })
    //nav category display control
    if (window.location.search.substr(1, 8) == 'category') {
        $(".f1ogg div:first").css("display", "none");
        $(".f1ogg div:last").css("display", "block");
        $("._2sZuJ div:first").css("display", "none");
        $("._2sZuJ div:last").css("display", "block");
    } else {
        $(".f1ogg div:last").css("display", "none");
        $(".f1ogg div:first").css("display", "block");
        $("._2sZuJ div:last").css("display", "none");
        $("._2sZuJ div:first").css("display", "block");
    }

    //
    if (has_sub_category == 0) {
        $("._2sZuJ div:last a").removeClass("_3l8UB");
        last_breadcrumb = $(".f1ogg div:last span:last a:last").text();
        j = 0
        for (var i = 0; i < $("._2sZuJ div:last a").length; i++) {
            if ($("._2sZuJ div:last a").eq(i).text() == last_breadcrumb) {
                j = i;
            }
        }
        $("._2sZuJ div:last a").eq(j).addClass("_3l8UB");

        $("._2sZuJ div:last a:first").click(function () {
            window.location.href = "http://" + window.location.host + "/course/list/" + $(".f1ogg div:last>span").eq(2).find("a:last").attr("href");
        })
    }

    //click search button to show search result
    $("._3AT4J a").click(function () {
        if ($("._3AT4J input").val() != '') {
            if (window.sessionStorage.getItem("degree_num") != '' && window.sessionStorage.getItem("degree_num") != null) {
                window.sessionStorage.removeItem("degree_num");
            }

            if (window.sessionStorage.getItem("vip_num") != '' && window.sessionStorage.getItem("vip_num") != null) {
                window.sessionStorage.removeItem("vip_num");
            }
            window.location.href = "http://" + window.location.host + "/course/list/?keywords=" + $("._3AT4J input").val();
        } else {
            $("._3AT4J input").focus();
        }
    })

    //category click clear free & degree seesionStorate
    $(".f1ogg a").click(function () {
        if (window.sessionStorage.getItem("degree_num") != '' && window.sessionStorage.getItem("degree_num") != null) {
            window.sessionStorage.removeItem("degree_num");
        }

        if (window.sessionStorage.getItem("vip_num") != '' && window.sessionStorage.getItem("vip_num") != null) {
            window.sessionStorage.removeItem("vip_num");
        }
    })
    $("._2sZuJ").click(function () {
        if (window.sessionStorage.getItem("degree_num") != '' && window.sessionStorage.getItem("degree_num") != null) {
            window.sessionStorage.removeItem("degree_num");
        }

        if (window.sessionStorage.getItem("vip_num") != '' && window.sessionStorage.getItem("vip_num") != null) {
            window.sessionStorage.removeItem("vip_num");
        }
    })

    // free or vip course choice begin
    if (window.sessionStorage.getItem("vip_num") != '' && window.sessionStorage.getItem("vip_num") != null) {
        vip_num = window.sessionStorage.getItem("vip_num");
        $("._1wxYr ul li").find("label").removeClass("ant-checkbox-wrapper-checked");
        $("._1wxYr ul li").find("label>span").removeClass("ant-checkbox-checked");
        $("._1wxYr ul li").eq(vip_num).find("label").addClass("ant-checkbox-wrapper-checked");
        $("._1wxYr ul li").eq(vip_num).find("label>span:first-child").addClass("ant-checkbox-checked");
    }

    $(".ant-checkbox-wrapper").click(function () {

        if (window.sessionStorage.getItem("degree_num") != '' && window.sessionStorage.getItem("degree_num") != null) {
            window.sessionStorage.removeItem("degree_num");
        }

        if ($(this).find("span").eq(2).text().trim() == "免费课程") {
            if ($(this).hasClass("ant-checkbox-wrapper-checked")) {
                window.sessionStorage.removeItem("vip_num");
                window.location.href = "http://" + window.location.host + "/course/list/";
            } else {
                window.sessionStorage.setItem("vip_num", "0");
                window.location.href = "http://" + window.location.host + "/course/list/?vip=0";
            }
        } else if ($(this).find("span").eq(2).text().trim() == "VIP精品课程") {
            if ($(this).hasClass("ant-checkbox-wrapper-checked")) {
                window.sessionStorage.removeItem("vip_num");
                window.location.href = "http://" + window.location.host + "/course/list/";
            } else {
                window.sessionStorage.setItem("vip_num", "1");
                window.location.href = "http://" + window.location.host + "/course/list/?vip=1";
            }
        }
    })
    //free or vip course choice end

    //degree choice mouse hover effect
    $(".f6G-g").hover(function () {
        $("._3jvAp").css("display", "block");
    }, function () {
        $("._3jvAp").css("display", "none");
    })

    //degree choice begin
    if (window.sessionStorage.getItem("degree_num") != '' && window.sessionStorage.getItem("degree_num") != null) {
        degree_num = window.sessionStorage.getItem("degree_num");
        $(".f6G-g span").text($("._3jvAp p").eq(degree_num).text());
        $("._3jvAp p").removeClass("_3ZNPH");
        $("._3jvAp p").eq(degree_num).addClass("_3ZNPH");
    }

    $("._3jvAp p").click(function () {

        if (window.sessionStorage.getItem("vip_num") != '' && window.sessionStorage.getItem("vip_num") != null) {
            window.sessionStorage.removeItem("vip_num");
        }

        if ($(this).text() == "难度选择") {
            window.sessionStorage.setItem("degree_num", "0");
            window.location.href = "http://" + window.location.host + "/course/list/";
        } else if ($(this).text().trim() == "初 级") {
            window.sessionStorage.setItem("degree_num", "1");
            window.location.href = "http://" + window.location.host + "/course/list/?degree=cj";
        } else if ($(this).text().trim() == "中 级") {
            window.sessionStorage.setItem("degree_num", "2");
            window.location.href = "http://" + window.location.host + "/course/list/?degree=zj";
        } else if ($(this).text().trim() == "高 级") {
            window.sessionStorage.setItem("degree_num", "3");
            window.location.href = "http://" + window.location.host + "/course/list/?degree=gj";
        }
    })
    //degree choice end

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