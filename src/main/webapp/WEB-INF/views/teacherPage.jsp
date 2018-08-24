<%--
  Created by IntelliJ IDEA.
  User: Wangzhili
  Date: 2018/8/2
  Time: 20:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"  %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
    <!--引入DES加密-->
    <script src="${APP_PATH}/static/js/aes.js"></script>
    <script src="${APP_PATH}/static/js/mode-ecb.js"></script>
</head>
<body style="background: #f0ad4e">

<!-- 班级修改弹出框 -->
<div class="modal fade" id="classSetModal" tabindex="-1" role="dialog" aria-labelledby="joinModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="addModalLabel">班级信息修改</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" >
                    <div class="form-group">
                        <label for="updateClassDepartment" class="col-sm-2 control-label">系部</label>
                        <div class="col-sm-10">
                            <input type="text" name="classDepartment" class="form-control" id="updateClassDepartment" placeholder="系部">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="updateClassDomain" class="col-sm-2 control-label">专业</label>
                        <div class="col-sm-10">
                            <input type="text" name="classDomain" class="form-control" id="updateClassDomain" placeholder="专业">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="updateClassName" class="col-sm-2 control-label">班级名</label>
                        <div class="col-sm-10">
                            <input type="text" name="className" class="form-control" id="updateClassName" placeholder="班级名">
                            <span class="help-block"></span>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" id="classModalUpdateBtn" class="btn btn-primary">保存</button>
            </div>
        </div>
    </div>
</div>
<!-- 班级加入弹出框 -->
<div class="modal fade" id="classJoinModal" tabindex="-1" role="dialog" aria-labelledby="addModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="joinModalLabel">加入班级</h4>
            </div>
            <br/>
            <div class="modal-body">
                <form class="form-horizontal" >
                    <div class="form-group">
                        <label for="updateClassDepartment" class="col-sm-3 control-label">班级加入码:</label>
                        <div class="col-sm-8">
                            <input type="text" name="joinClassCode" class="form-control" id="joinClassCode" placeholder="班级码：联系管理员获取">
                            <span class="help-block"></span>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" id="classModalJoinBtn" class="btn btn-primary">确认加入</button>
            </div>
        </div>
    </div>
</div>

<div class="jumbotron">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <h1>你好! ${teacherName}老师</h1>
                <h2>在这里你将有权限管理你的班级以及你的学生。</h2>
                <p>@Wangzl</p>
            </div>
        </div>
        <div class="row">
            <!--班级的展示-->
            <!--操作按钮-->
            <div class="row">
                <div class="col-md-4 col-md-offset-9">
                    <button class="btn btn-warning " id="signOutBtn"> <span class="glyphicon glyphicon-share" aria-hidden="true"></span> 登出</button>
                    <button class="btn btn-success "  id="joinInClassBtn"> <span class="glyphicon glyphicon-plus" aria-hidden="true"></span> 加入</button>
                </div>
            </div>
            <div class="row"><br/></div>
            <!--班级表格-->
            <div class="row">
                <!--教职工的展示-->
                <div class="col-md-12">
                    <table class="table table-hover" id="classTable">
                        <thead>
                        <tr class="warning">
                            <th>编号</th>
                            <th>系部</th>
                            <th>专业</th>
                            <th>班级</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody id="classTableBody">
                        <!--表格体-->
                        </tbody >

                    </table>
                </div>
            </div>
            <!--分页文字信息-->
            <div class="col-md-6" >
                <h4 id="pageInfoArea">
                </h4>
            </div>
            <!--分页条-->
            <div class="col-md-6 col-md-offset-9" id="pageNavArea">
            </div>
        </div>

    </div>
</div>
<div class="row">
    <div class="alert alert-warning alert-dismissible col-md-4 col-md-offset-4" role="alert">
        <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <strong>小提示：</strong> 教师能够在这个界面管理自己的班级以及学生。
    </div>
</div>

<form id="toStudentPage" action="/tostudentpage" method="post">
    <<input type="hidden" id="toPageClassCode"  name="toPageClassCode" value=""/>
</form>

</body>
</html>


<script>
    var teacherId = ${teacherId};
    var classid =-1;
    $(function () {
        toPage();
    });
    //页面跳转的ajax请求
    function toPage() {
        var requestCode = Encrypt(teacherId);
        $.ajax({
            url:"${APP_PATH}/classlist",
            data:"requestCode="+requestCode,
            type:"POST",
            success:function (result) {
             buildClassTable(result);
            }
        })
    };

    //界面跳转到学生界面
    $(document).on("click",".classManagementBtn",function () {
        var classCode = Encrypt($(this).parents("tr").find("td:eq(0)").text());
        $("#toPageClassCode").val(classCode);
        $("#toStudentPage").submit();
    });

    //解析页面
    function buildClassTable(result) {
        $("#classTableBody").empty();
        var classes = result.extend.pageInfo.list;
        $.each(classes,function (index,item) {
            var classIdTd = $("<td></td>").append(item.classId);
            var classDepartmentTd = $("<td></td>").append(item.classDepartment);
            var classDomainTd = $("<td></td>").append(item.classDomain);
            var classNameTd = $("<td></td>").append(item.className);
            var classManagementBtn = $("<button></button>").addClass("btn btn-warning btn-sm classManagementBtn")
                .append($("<span></span>").addClass("glyphicon glyphicon-user")).append(" 学生管理");
            var deleteBtn = $("<button></button>").addClass("btn btn-danger btn-sm deleteBtn")
                .append($("<span></span>").addClass("glyphicon glyphicon-trash")).append(" 退出班级");
            var editBtn = $("<button></button>").addClass("btn btn-info btn-sm editBtn")
                .append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append(" 修改班级");
            var btnTd = $("<td></td>").append(classManagementBtn).append(" ").append(deleteBtn).append(" ").append(editBtn);
            $("<tr></tr>").append(classIdTd)
                .append(classDepartmentTd)
                .append(classDomainTd)
                .append(classNameTd)
                .append(btnTd)
                .appendTo("#classTableBody");
        });
    };


    //获取班级信息
    function getClass(id){
        var code = Encrypt(id);
        $.ajax({
            url:"${APP_PATH}/getclass",
            data:"requestCode="+code,
            type:"POST",
            success:function (result) {
                var classData = result.extend.class;
                $("#updateClassName").val(classData.className);
                $("#updateClassDomain").val(classData.classDomain);
                $("#updateClassDepartment").val(classData.classDepartment);
            }
        })
    }
    //班级信息修改弹出框显示
    $(document).on("click",".editBtn",function () {
        classid = $(this).parents("tr").find("td:eq(0)").text();
        getClass(classid);
        $("#classSetModal").modal({
            backdrop:"static"
        });
    });
    //班级信息更新按钮
    $("#classModalUpdateBtn").click(function () {
        $.ajax({
            url:"${APP_PATH}/setclass",
            type:"POST",
            data: $("#classSetModal form").serialize()+"&"+"requestCode="+Encrypt(classid),
            success:function (result) {
                if(result.code==666) {
                    //更新成功 关闭模态框，刷新页面
                    $("#classSetModal").modal('hide');
                    toPage();
                }
            }
        })
    });


   //加入班级弹出框按钮
    $("#joinInClassBtn").click(function () {
        $("#joinClassCode").parent().removeClass("has-error");
        $("#joinClassCode").val("");
        $("#joinClassCode").next("span").text("");
        $("#classJoinModal").modal({
            backdrop:"static"
        });
    });
    $("#classModalJoinBtn").click(function () {
        var code = Encrypt(teacherId);
        $.ajax({
            url:"${APP_PATH}/joinclass",
            data: $("#classJoinModal form").serialize()+"&requestCode="+code,
            type:"POST",
            success:function (result) {
                if(result.code==666){
                    $("#classJoinModal").modal('hide');
                    toPage();
                }else if(result.code==555){
                    $("#joinClassCode").parent().addClass("has-error");
                    $("#joinClassCode").next("span").text(result.extend.msg);
                }
            }
        });
    });
    //班级退出按钮
    $(document).on("click",".deleteBtn",function () {
        classid = $(this).parents("tr").find("td:eq(0)").text();
        var requestCodeT = Encrypt(teacherId);
        var requestCodeC = Encrypt(classid);
        if(confirm("确定退出该班级？")){
            $.ajax({
                url:"${APP_PATH}/outclass",
                data:"requestCodeT="+requestCodeT+"&requestCodeC="+requestCodeC,
                type:"POST",
                success:function (result) {
                    toPage();
                }
            });
        }
    });

    //登出按钮的监听事件
    $("#signOutBtn").click(function () {
        if (confirm("你确定要注销吗？")){
            window.location.href="${APP_PATH}/index.jsp"
        }
    });




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
</script>
