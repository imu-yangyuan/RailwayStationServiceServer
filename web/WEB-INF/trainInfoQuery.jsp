<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title></title>
    <style>

        html, body, div, span, applet, object, iframe, h1, h2, h3, h4, h5, h6, p, blockquote, pre, a, abbr, acronym, address, big, cite, code, del, dfn, em, img, ins, kbd, q, s, samp, small, strike, strong, sub, sup, tt, var, b, u, i, dl, dt, dd, ol, nav ul, nav li, fieldset, form, label, legend, table, caption, tbody, tfoot, thead, tr, th, td, article, aside, canvas, details, embed, figure, figcaption, footer, header, hgroup, menu, nav, output, ruby, section, summary, time, mark, audio, video {
            margin: 0;
            padding: 0;
            border: 0;
            font-size: 100%;
            font: inherit;
            vertical-align: baseline;
        }

        ol, ul {
            list-style: none;
            margin: 0px;
            padding: 0px;
        }

        #head {
            z-index: 300;
            /* background: #e3e3e3;*/
            min-width: 500px;
            padding: 0;
            width: 1000px;
            position: fixed;
            font-size: 12px;
            height: 60px;
            left: 50%;
            margin-left: -500px;
        }

        #form {
            background-color: #fff;
            margin-left: 200px;
            border: none;
            vertical-align: top;
            border-radius: 2px;
            box-shadow: 0 1px 2px 0 rgba(0, 0, 0, 0.16), 0 0 0 1px rgba(0, 0, 0, 0.08);
            transition: box-shadow 200ms cubic-bezier(0.4, 0.0, 0.2, 1);
        }

        #form .s_ipt_wr {
            height: 36px;
            border-radius: 3px 0 0 3px;
        }

        form {
            display: block;
        }

        .fm {
            clear: none;
            float: left;
            margin: 11px 0 0 10px;
            position: relative;
            z-index: 297;
        }

        .s_form {
            background-color: #fff;
            height: 60px;
            box-shadow: 0px 0px 5px rgba(0, 0, 0, .5);
            padding: 0 0 0 10px;
        }

        .s_form:after, .s_tab:after {
            content: ".";
            display: block;
            height: 0;
            clear: both;
            visibility: hidden;
        }

        .wrapper_s .s_ipt_wr {
            width: 439px;
        }

        #form .s_ipt {
            margin: 8px 0 0 10px;
        }

        .s_ipt_wr {
            border-color: #7b7b7b #b6b6b6 #b6b6b6 #7b7b7b;
            background: #fff;
            display: inline-block;
            vertical-align: top;
            width: 439px;
            margin-right: 0;
            border-right-width: 0;
            overflow: hidden;
            display: inline-block;
            vertical-align: top;
            border: none;
        }

        form {
            display: block;
            margin-top: 0em;
        }

        #form .s_btn {
            height: 36px;
            border: none;
            box-shadow: 0 0 3px 0px rgba(40, 102, 189, 1);
            border-radius: 0 3px 3px 0;
            transition: background 0.1s;
            cursor: pointer;
        }

        .s_btn {
            width: 100px;
            height: 34px;
            color: #fff;
            outline: medium;
            letter-spacing: 1px;
            background: #3385ff;
        }

        .s_btn_wr {
            width: auto;
            height: auto;
            display: inline-block;
            background-position: -120px -48px;
            z-index: 0;
            vertical-align: top;
        }

        body {
            color: #333;
            background: #fff;
            margin: 0;
            position: relative;
            min-width: 900px;
        }

        .wrapper_l #kw {
            width: 420px;
            position: relative;
        }

        .s_ipt {
            width: 526px;
            height: 22px;
            font: 16px/18px arial;
            line-height: 22px;
            padding: 0;
            background: transparent;
            border: 0;
            outline: 0;
            -webkit-appearance: none;
        }

        /*    */
        #container {
            z-index: 200;
            position: relative;
            top: 60px;
            word-break: break-all;
            word-wrap: break-word;
            width: 1200px;
            left: 50%;
            margin-left: -600px;
        }

        .c-container {
            width: 538px;
            font-size: 13px;
            line-height: 1.54;
            word-wrap: break-word;
            word-break: break-word;
        }

        #rs, #content_left .c-container {
            width: 640px;
            padding: 0px 20px 10px;
            margin-top: 10px;
            margin-bottom: 10px;
            border-radius: 3px;
            background-color: #fefefe;
            box-sizing: border-box;
            /* -moz-box-shadow: 0px 0px 3px #cecece; */
            box-shadow: 0 1px 10px rgba(0, 0, 0, 0.12);
            -webkit-box-shadow: 0 1px 10px rgba(0, 0, 0, 0.12);
            -moz-box-shadow: 0 1px 10px rgba(0, 0, 0, 0.12);
        }

        .result {
            width: 33.7em;
            table-layout: fixed;
        }

        #content_left {
            padding-top: 10px;
            width: 540px;
            padding-left: 260px;
        }

        a {
            text-decoration: none;
            color: #2866bd;
            font-weight: bold;
        }

        a:visited em {
            color: #660099;
        }

        /*a:-webkit-any-link {
          color: -webkit-link;
          cursor: auto;
          text-decoration: underline;
        }*/
        a:visited:after {
            content: "";
            position: absolute;
            border-bottom: 2px solid;
            bottom: -2px;
            left: 100%;
            width: 0;
            -webkit-transition: width 350ms, left 350ms;
            -moz-transition: width 350ms, left 350ms;
            transition: width 350ms, left 350ms;
        }

        .t {
            font-weight: 400;
            font-size: medium;
            margin-bottom: 1px;
        }

        .c-container h3 {
            margin: 0px -20px 10px;
            padding: 8px 20px 5px;
            border-radius: 3px 3px 0px 0px;
            box-shadow: 0 1px 0px 0px rgba(0, 0, 0, .05);
            -webkit-box-shadow: 0 1px 0px 0px rgba(0, 0, 0, .05);
            -moz-box-shadow: 0 1px 0px 0px rgba(0, 0, 0, .05);
        }

        /*     */
        #page {
            position: absolute;
            left: 50%;
            margin-left: -410px;
            font: 14px arial;
            white-space: nowrap;
            display: inline-block;
            min-width: 710px;
            height: 40px;
            line-height: 40px;
            padding: 5px 10px;
            text-align: center;
            white-space: nowrap;
        }

        #page a, #page strong {
            display: inline-block;
            vertical-align: text-bottom;
            text-align: center;
            line-height: 34px;
            text-decoration: none;
            overflow: hidden;
            margin-right: 9px;
            background: #fff;
            cursor: pointer;
            color: #2866bd;
        }

        #page .n {
            height: 34px;
            padding: 0 18px;
            border: 1px solid #e1e2e3;
        }

        #page a, #page strong, #page strong .pc {
            box-shadow: 0 1px 10px rgba(0, 0, 0, 0.1);
            -webkit-box-shadow: 0 1px 10px rgba(0, 0, 0, 0.1);
            -moz-box-shadow: 0 1px 10px rgba(0, 0, 0, 0.1);
        }

        #page .pc {
            width: 34px;
            height: 34px;
            border: 1px solid #e1e2e3;
            cursor: pointer;
        }

        #page span {
            display: block;
        }

        strong .pc {
            background: #5d71ce;
            color: white;
            border-radius: 3px;
        }

        #page strong .pc {
            cursor: auto;
        }
        #return {
            z-index: 300;
            position: fixed;
            width: 150px;
            height: 40px;
            border-radius: 25px;
            bottom: 80px;
            right: 80px;
            background-color: #c9f3c6;
            box-shadow: 0px 0px 12px #73ff6f;
            line-height: 40px;
            text-align: center;
            cursor: pointer;
            font-size: 20px;
            color: #000000;

        }
        #return a{
            display: block;
            text-decoration: none;
            width:150px;
            height: 36px;
        }

        #page strong .pc {
            background: #5d71ce;
            color: white;
            border-radius: 3px;
        }

        .runsection {
            color: #19ef9e;
        }

        .daoDian {
            color: #0dccd2;
        }

        .kaidian {
            color: #86fa1a;
        }
    </style>
</head>
<body>
<div id="wrapper" class="wrapper_l">
    <div id="head">
        <div class="head_wrapper">
            <div class="s_form">
                <form id="form" name="f" action="${basePath}trainInfoQuery.php" class="fm">
          <span class="bg s_ipt_wr quickdelete-wrap">
            <span
                    class="soutu-btn"></span>



      <input id="kw"
             name="keyword"
             class="s_ipt"
             value="${keyword}"
             maxlength="255"
             autocomplete="off" placeholder="请输入车次或始发站" >
      </span>
                    <span class="bg s_btn_wr"><input type="submit" id="su" value="查询"
                                                     class="bg s_btn"></span>
                </form>
            </div>
        </div>

    </div>
    <div id="container" class="container_l">
        <div id="content_left">
            <c:forEach items="${pb.beanList}" var="trainInfo">
                <div class="result c-container ">
                    <h3 class="t c-gap-bottom-small">
                        <a
                                href="${basePath}trainInfoDetail.php?trainInfoId=${trainInfo.id}"
                        >${ trainInfo.trainNumber}次列车</a>
                    </h3>
                    <div class="c-row">
                        <b class="runsection">运行区间：${ trainInfo.startStation}-->${ trainInfo.terminus}</b>&nbsp;&nbsp;
                        <b class="kaidian">开点：${ trainInfo.kaiDian}</b>&nbsp;&nbsp;
                        <b class="daoDian">到点：${ trainInfo.daoDian}</b>&nbsp;&nbsp;
                        乘车地点：${ trainInfo.trainStationName}
                        <br>
                        候车室：${ trainInfo.waitingRoom}&nbsp;&nbsp;
                        检票口：${ trainInfo.jianPiaoKou}&nbsp;&nbsp;
                        站台：${ trainInfo.station}
                    </div>
                </div>
            </c:forEach>
        </div>

        <div id="page">
            <c:if test="${pb.tp>1 }">
                <a
                        href="${basePath}trainInfoQuery.php?keyword=${keyword}&pc=1"
                        class="n">首页</a>
            </c:if>

            <c:if test="${pb.pc > 1 }">
                <a href="${basePath}trainInfoQuery.php?keyword=${keyword}&pc=${pb.pc-1}" class="n">&lt;上一页</a>
            </c:if>
            <c:choose>
                <c:when test="${pb.tp <= 6 }">
                    <c:set var="begin" value="1"/>
                    <c:set var="end" value="${pb.tp }"/>
                </c:when>
                <c:otherwise>
                    <c:set var="begin" value="${pb.pc-3 }"/>
                    <c:set var="end" value="${pb.pc+2 }"/>
                    <c:if test="${begin < 1 }">
                        <c:set var="begin" value="1"/>
                        <c:set var="end" value="6"/>
                    </c:if>
                    <c:if test="${end > pb.tp }">
                        <c:set var="begin" value="${pb.tp - 5 }"/>
                        <c:set var="end" value="${pb.tp }"/>
                    </c:if>
                </c:otherwise>
            </c:choose>
            <c:forEach var="i" begin="${begin }" end="${end }">
                <c:choose>
                    <c:when test="${i eq pb.pc }">
                        <strong><span class="fk fk_cur"><i
                                class="c-icon c-icon-bear-p"></i></span><span class="pc">${i }</span></strong>
                    </c:when>
                    <c:otherwise>
                        <a
                                href="${basePath}trainInfoQuery.php?keyword=${keyword}&pc=${i}"><span
                                class="fk fkd"><i class="c-icon c-icon-bear-pn"></i></span><span
                                class="pc">${i }</span></a>
                    </c:otherwise>
                </c:choose>

            </c:forEach>
            <c:if test="${pb.pc < pb.tp }">
                <a
                        href="${basePath}trainInfoQuery.php?keyword=${keyword}&pc=${pb.pc+1}"
                        class="n">下一页&gt;</a>
            </c:if>
            <c:if test="${pb.tp>1 }">
                <a href="${basePath}trainInfoQuery.php?keyword=${keyword}&pc=${pb.tp}" class="n">尾页</a>
            </c:if>
        </div>
    </div>
</div>
<div id="return"><a href="${basePath}second.html">返回</a></div>
</body>
</html>