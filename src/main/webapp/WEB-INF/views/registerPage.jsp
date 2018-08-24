<%--
  Created by IntelliJ IDEA.
  User: Wangzhili
  Date: 2018/8/2
  Time: 20:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"  %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<html>
<head>
    <title>登录</title>
    <%
        pageContext.setAttribute("APP_PATH",request.getContextPath());
    %>
    <!--引入jQuery文件-->
    <script type="text/javascript" src="${APP_PATH}/static/js/jquery-3.3.1.min.js"></script>
    <!--引入样式-->
    <link href="${APP_PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <!--引入JS文件-->
    <script src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <!--引入md5文件-->
    <script type="text/javascript" src="${APP_PATH}/static/js/md5.js"></script>
    <!--引入DES加密-->
    <script src="${APP_PATH}/static/js/aes.js"></script>
    <script src="${APP_PATH}/static/js/mode-ecb.js"></script>
</head>
<body style="background: #f0ad4e">
<!--登录框体-->
<div class="jumbotron">
<div class="container">
    <!--登录头-->
    <div class="row">
        <div class="col-lg-12">
            <h1>Maven+SSM框架的学生管理系统</h1>
            <h2>欢迎！这是登录界面，请在这里输入你的邮箱和密码！</h2>
            <p>利用SSM实现简单的CRUD操作。 @Wangzl</p>
            <br><br/>  <br><br/>  <br><br/>
        </div>
    </div>
    <!--登录输入框-->
    <div class="row">
        <br/>
        <div class="col-md-4 col-md-offset-4">
            <form class="form-horizontal" id="registerForm" method="post" action="/register">
                <!--禁止浏览器的自动密码填充-->
                <input type="email" style="display:none">
                <input type="password" style="display:none">

                <div class="form-group ">
                    <label for="inputEmail" class="col-sm-2 control-label" ></label>
                    <div class="col-md-12 input-group input-group-lg">
                        <span class="input-group-addon">邮箱</span>
                        <input type="email" class="form-control" id="inputEmail" name="email" placeholder="Email">
                    </div>
                </div>


                <div class="form-group ">
                    <label for="inputPassword" class="col-sm-2 control-label" ></label>
                    <div class="col-md-12 input-group input-group-lg">
                        <span class="input-group-addon">密码</span>
                        <input type="password" class="form-control" autocomplete="off" id="inputPassword"  name="password" placeholder="Password">
                    </div>
                </div>
                <br/>
                <div class="form-group">
                    <div class=" col-lg-12">
                        <button type="button" id="registerBtn" class="btn bg-primary btn-block btn-lg">登录</button>
                        <br/>
                    </div>
                </div>
            </form>
        </div>
        <br/>
    </div>
</div>
</div>
<!--提示消息-->
<div>
    <br/>
    <div class="row">
        <c:if test="${prompt!='-1'}">
            <div class="alert alert-danger alert-dismissible col-md-4 col-md-offset-4" role="alert">
                <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <strong>错误：</strong> ${prompt}
            </div>
        </c:if>
    </div>
    <div class="row">
        <div class="alert alert-warning alert-dismissible col-md-4 col-md-offset-4" role="alert">
            <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <strong>小提示：</strong> 管理员账号能够管理教师账户，教师账户能够管理班级。.
        </div>
    </div>
    <div class="row">
        <div class="alert alert-warning alert-dismissible col-md-4 col-md-offset-4" role="alert">
            <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <strong>小提示：</strong> 我家的服务器什么都慢，就死机卡死快的一批！
        </div>
    </div>
    <div class="row">
        <div class="alert alert-warning alert-dismissible col-md-4 col-md-offset-4" role="alert">
            <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <strong>小提示：</strong> 没有什么写的，强迫症在这里占位置。.
        </div>
    </div>
</div>
<br/>
</body>
</html>

<script type="text/javascript">

    //AES的加密算法
    function Encrypt(word){
        var key = CryptoJS.enc.Utf8.parse("Wangzhili&Wangli");

        var srcs = CryptoJS.enc.Utf8.parse(word);
        var encrypted = CryptoJS.AES.encrypt(srcs, key, {mode:CryptoJS.mode.ECB,padding: CryptoJS.pad.Pkcs7});
        return encrypted.toString();
    }
    function Decrypt(word){
        var key = CryptoJS.enc.Utf8.parse("Wangzhili&Wangli");

        var decrypt = CryptoJS.AES.decrypt(word, key, {mode:CryptoJS.mode.ECB,padding: CryptoJS.pad.Pkcs7});
        return CryptoJS.enc.Utf8.stringify(decrypt).toString();
    }

    function md5Password(text,key) {
        var md5key = text+key;
        return $.md5(md5key);
    }


    $("#registerBtn").click(function () {
        $.ajax({
            url:"${APP_PATH}/getmd5key",
            type:"POST",
            success:function (result) {
                var  md5key=result.extend.md5key;
                document.getElementById("inputEmail").value=Encrypt(document.getElementById("inputEmail").value);
                //$("#inputEmail").val(Encrypt($("#inputEmail").val()));
                document.getElementById("inputPassword").value=md5Password(document.getElementById("inputPassword").value,md5key);
              //  $("#inputPassword").val(md5Password( $("#inputPassword").val(),md5key));
                $("#registerForm").submit();

            }
        });

    })
</script>