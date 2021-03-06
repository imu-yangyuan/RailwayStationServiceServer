<%--
  Created by IntelliJ IDEA.
  User: yangy
  Date: 2018/2/6
  Time: 21:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title></title>
    <style tpe="text/css">

        body{
            /* background: #000;*/
            width: 100%;
            height: 100%;

        }

        .none{
            display: none;
        }

        .layout-root{
            position: fixed;
            background: url("static/images/msgbg.jpg") no-repeat;
            background-size:100% 100%;
            /* background: #E74C3C;*/
            height: 100%;
            width: 100%;
            z-index: 1000;
            top: 0;
            left: 0;
        }

        .layout-content{
            line-height: 44px;
            font-weight: 300;
            font-size: 1em;
            color: #fff;
            text-indent: 10px;
        }

        .layout-content .code{
            line-height: 22px;
            text-align: center;
        }

        p {
            display: block;
            -webkit-margin-before: 1em;
            -webkit-margin-after: 1em;
            -webkit-margin-start: 0px;
            -webkit-margin-end: 0px;
        }

        a, button{
            outline: none;
        }

        button {
            border: none;
            padding: 0.6em 1.2em;
            background: #92c9a6;
            color: #0a0a0a;
            font-size: 1em;
            cursor: pointer;
            display: block;
            margin: 3px auto;
            border-radius: 2px;
        }

        button:hover, button:active, button:focus{
            border: none;
        }


        .dialog-face{
            position: fixed;
            background: url("images/msgbg.jpg") no-repeat;
            background-size:100% 100%;
            height: 100%;
            width: 100%;
            z-index: 1000;
            top: 0;
            left: 0;

            -webkit-animation-duration: 500ms;
            -moz-animation-duration:500ms;
            -o-animation-duration:500ms;
            animation-duration: 500ms;
        }

        .dialog-face.slipBottom[opacity="0"]{
            display: none;
        }

        .dialog-face.slipUp{
            opacity: 0.7;
            -webkit-animation-name: dialogFaceSlipToUp;
            -moz-animation-name: dialogFaceSlipToUp;
            -o-animation-name: dialogFaceSlipToUp;
            animation-name: dialogFaceSlipToUp;
        }

        .dialog-face.slipBottom{
            opacity: 0;
            visibility: hidden;
            -webkit-animation-name: dialogFaceSlipToBottom;
            -moz-animation-name: dialogFaceSlipToBottom;
            -o-animation-name: dialogFaceSlipToBottom;
            animation-name: dialogFaceSlipToBottom;
        }

        .dialog-root{
            position: fixed;
            z-index: 2000;
            left: 50%;

            -webkit-animation-duration: 500ms;
            -moz-animation-duration: 500ms;
            -o-animation-duration: 500ms;
            animation-duration: 500ms;
            -webkit-perspective: 1300px;
            -moz-perspective: 1300px;
            perspective: 1300px;
        }

        .dialog-root.slipUp{
            top: 50%;
            opacity: 1;

            -webkit-animation-name: dialogSlipToUp;
            -moz-animation-name: dialogSlipToUp;
            -o-animation-name: dialogSlipToUp;
            animation-name: dialogSlipToUp;
            -webkit-transform: translate(-50%, -50%);
            -o-transform: translate(-50%, -50%);
            -moz-transform: translate(-50%, -50%);
            -ms-transform: translate(-50%, -50%);
            transform: translate(-50%, -50%);
        }

        .dialog-root.slipBottom{
            top: 100%;
            opacity: 0.3;
            -webkit-animation-duration: 500ms;
            -moz-animation-duration: 500ms;
            -o-animation-duration: 500ms;
            animation-duration: 500ms;
            -webkit-animation-name: dialogSlipToBottom;
            -moz-animation-name: dialogSlipToBottom;
            -o-animation-name: dialogSlipToBottom;
            animation-name: dialogSlipToBottom;
            -webkit-transform: translate(-50%, 0);
            -o-transform: translate(-50%, 0);
            -moz-transform: translate(-50%, 0);
            -ms-transform: translate(-50%, 0);
            transform: translate(-50%, 0);
        }

        .dialog-wrapper{
            background: #fcfcf2;
            width: 635px;
            height: 375px;
            overflow: hidden;
            -webkit-border-radius: 5px;
            -moz-border-radius: 5px;
            border-radius: 5px;

            -webkit-animation-duration: 500ms;
            -moz-animation-duration: 500ms;
            -o-animation-duration: 500ms;
            animation-duration: 500ms;
            -webkit-transform-origin: 50% 100%;
            -moz-transform-origin: 50% 100%;
            -ms-transform-origin: 50% 100%;
            -o-transform-origin:50% 100%;
            transform-origin: 50% 100%;
        }

        .dialog-wrapper.slipUp{
            -webkit-transform: rotateX(0deg);
            -moz-transform: rotateX(0deg);
            -ms-transform: rotateX(0deg);
            -o-transform: rotateX(0deg);
            transform: rotateX(0deg);
            -webkit-animation-name: contentSlipToUp;
            -moz-animation-name: contentSlipToUp;
            -o-animation-name: contentSlipToUp;
            animation-name: contentSlipToUp;
        }

        .dialog-wrapper.slipBottom{
            -webkit-transform: rotateX(90deg);
            -moz-transform: rotateX(90deg);
            -ms-transform: rotateX(90deg);
            -o-transform: rotateX(90deg);
            transform: rotateX(90deg);
            -webkit-animation-name: contentSlipToBottom;
            -moz-animation-name: contentSlipToBottom;
            -o-animation-name: contentSlipToBottom;
            animation-name: contentSlipToBottom;
        }

        .dialog-header{
            height: 75px;
            background: #009fb8;
            text-align: center;
        }

        .dialog-header span{
            font-size: 28px;
            line-height: 75px;
            color: #ffffff;
        }

        .dialog-content{
            font-weight: 300;
            font-size: 2em;
            font-family: "Microsoft YaHei" ! important;
            text-align: center;
            line-height: 2.2em;
            color: #000000;
            padding: 15px 40px 20px 40px;
            margin: 0;
        }


        .dialog-content p{
            margin: 0;
            padding: 10px 0;
        }

        .dialog-footer{
            position: absolute;
            left: 45%;
            bottom:20px;
        }


        @keyframes dialogFaceSlipToUp  {
            0%{
                opacity: 0;
            }
            100%{
                opacity: 0.7;
            }
        }

        @keyframes dialogFaceSlipToBottom {
            0%{
                opacity: 0.7;
                visibility:visible;
            }
            100%{
                visibility: hidden;
                opacity: 0;
            }
        }

        @keyframes dialogSlipToUp  {
            0%{
                top: 100%;
                opacity: 0.3;
            }
            100%{
                top: 50%;
                opacity: 1;
            }
        }

        @keyframes dialogSlipToBottom  {
            0%{
                top: 50%;
                opacity: 1;
                -webkit-transform: translate(-50%, -50%);
                -moz-transform: translate(-50%, -50%);
                -ms-transform: translate(-50%, -50%);
                -o-transform: translate(-50%, -50%);
                transform: translate(-50%, -50%);
            }
            100%{
                top: 100%;
                opacity: 0.3;
                -webkit-transform: translate(-50%, 0);
                -moz-transform: translate(-50%, 0);
                -ms-transform: translate(-50%, 0);
                -o-transform: translate(-50%, 0);
                transform: translate(-50%, 0);
            }
        }

        @keyframes contentSlipToUp  {
            0%{
                -webkit-transform: rotateX(90deg);
                -moz-transform: rotateX(90deg);
                -ms-transform: rotateX(90deg);
                -o-transform: rotateX(90deg);
                transform: rotateX(90deg);
            }
            100%{
                -webkit-transform: rotateX(0deg);
                -moz-transform: rotateX(0deg);
                -ms-transform: rotateX(0deg);
                -o-transform: rotateX(0deg);
                transform: rotateX(0deg);
            }
        }

        @keyframes contentSlipToBottom  {
            0%{
                -webkit-transform: rotateX(0deg);
                -moz-transform: rotateX(0deg);
                -ms-transform: rotateX(0deg);
                -o-transform: rotateX(0deg);
                transform: rotateX(0deg);
            }
            60%{
                -webkit-transform: rotateX(60deg);
                -moz-transform: rotateX(60deg);
                -ms-transform: rotateX(60deg);
                -o-transform: rotateX(60deg);
                transform: rotateX(60deg);
            }
            100%{
                -webkit-transform: rotateX(90deg);
                -moz-transform: rotateX(90deg);
                -ms-transform: rotateX(90deg);
                -o-transform: rotateX(90deg);
                transform: rotateX(90deg);
            }
        }
    </style>
</head>
<body>
<div class="fixed layout-root">
    <div class="layout-content">

    </div>
</div>
<div id="dialog-face" class="none">
</div>
<div id="dialog" class="none">
    <div id="dialog-wrapper">
        <div class="dialog-header">
            <span>消息提示</span>
        </div>
        <div class="dialog-content">
            <p>${msg.msg}</p>

        </div>
        <div class="dialog-footer">
            <button onclick="toTagetUrl(${msg.state},'${msg.url}')">关闭</button>
        </div>
    </div>
</div>
<script type="text/javascript">
    window.onload=function () {
        toggleDialog(true);
    }
    function toggleDialog(show){
        var animationClass = show ? "slipUp" : "slipBottom";
        var animation = function(){
            var ele = document.getElementById("dialog-face");
            ele.className = "dialog-face " + animationClass;
            ele = document.getElementById("dialog");
            ele.className = "dialog-root " + animationClass;
            ele = document.getElementById("dialog-wrapper");
            ele.className = "dialog-wrapper " + animationClass;
        };

        setTimeout(animation, 100);
    }
    function toTagetUrl(state,url) {
        if(state==1){
            window.location.href=url;
        }else{
            history.go(-1);
        }

    }
</script>
</body>
</html>
