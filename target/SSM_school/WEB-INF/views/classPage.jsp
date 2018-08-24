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
<div class="modal fade" id="classSetModal" tabindex="-1" role="dialog" aria-labelledby="addModalLabel">
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
<!-- 班级添加弹出框 -->
<div class="modal fade" id="classAddModal" tabindex="-1" role="dialog" aria-labelledby="addClassModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="addClassModalLabel">新增班级</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" >
                    <div class="form-group">
                        <label for="addClassDepartment" class="col-sm-2 control-label">系部</label>
                        <div class="col-sm-10">
                            <input type="text" name="classDepartment" class="form-control" id="addClassDepartment" placeholder="系部">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="addClassDomain" class="col-sm-2 control-label">专业</label>
                        <div class="col-sm-10">
                            <input type="text" name="classDomain" class="form-control" id="addClassDomain" placeholder="专业">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="addClassName" class="col-sm-2 control-label">班级名</label>
                        <div class="col-sm-10">
                            <input type="text" name="className" class="form-control" id="addClassName" placeholder="班级名">
                            <span class="help-block"></span>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" id="classModalAddBtn" class="btn btn-primary">添加</button>
            </div>
        </div>
    </div>
</div>
 <!-- 任课管理弹出框 -->
<div class="modal fade" id="teachManagementModal" tabindex="-1" role="dialog" aria-labelledby="managementModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="messageModalLabel">任课管理</h4>
            </div>
            <br/>
            <div class="modal-body">
                <form class="form-horizontal" >
                    <div class="form-group">
                        <label for="managementTeacherId" class="col-sm-3 control-label">教师编码:</label>
                        <div class="col-sm-8">
                            <input type="text" name="TeacherId" class="form-control" id="managementTeacherId" placeholder="教师编号">
                            <span class="help-block"></span>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="managementClassCode" class="col-sm-3 control-label">班级码:</label>
                        <div class="col-sm-8">
                            <input type="text" name="ClassCode" class="form-control" id="managementClassCode" placeholder="班级码">
                            <span class="help-block"></span>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" id="classModalManagementBtn" class="btn btn-primary">退出/加入</button>
            </div>
        </div>
    </div>
</div>
 <!-- 班级详情 -->
<div class="modal fade" id="classAttrModal" tabindex="-1" role="dialog" aria-labelledby="classAttribute">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="classAttribute">班级详情</h4>
            </div>
            <div class="modal-body">
                <form  class="form-horizontal">
                    <div class="form-group">
                        <label for="classNumber" class="col-sm-2 control-label">学生人数</label>
                        <div class="col-sm-10">
                            <p  name="classNumber" class="form-control" id="classNumber">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="classTeachers" class="col-sm-2 control-label">任课教师</label>
                        <div class="col-sm-10">
                            <p  name="classTeachers" class="form-control" id="classTeachers">
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<div class="jumbotron">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <h1>你好! 管理员</h1>
                <h2>在这里你将有权限管理你的班级以及你的学生。</h2>
                <p>@Wangzl</p>
            </div>
        </div>
        <div class="row">
            <!--班级的展示-->


            <!--操作按钮-->
            <div class="row">
                <div class="col-md-4 col-md-offset-8">
                    <button class="btn btn-warning " id="signOutBtn"> <span class="glyphicon glyphicon-share" aria-hidden="true"></span> 系统登出</button>
                    <button class="btn btn-success "  id="addClassBtn"> <span class="glyphicon glyphicon-plus" aria-hidden="true"></span> 新建班级</button>
                    <button class="btn btn-info "  id="teachManagementBtn"> <span class="glyphicon glyphicon-education" aria-hidden="true"></span> 任课管理</button>
                </div>
            </div>
            <div class="row"><br/></div>
            <!--班级表格-->
            <div class="row">
                <!--教职工的展示-->
                <div class="col-md-12">
                    <table class="table table-hover" id="classTable">
                        <thead>
                        <tr class="warning text-center">
                            <th>编号</th>
                            <th>系部</th>
                            <th>专业</th>
                            <th>班级</th>
                            <th>加入码</th>
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
    var page;
    var pageEnd;
    $(function () {
        toPage(1)
    });
    //页面跳转的ajax请求
    function toPage(pageNum) {
        var code = Encrypt(pageNum);
        $.ajax({
            url:"${APP_PATH}/classlists",
            data:"requestCode="+code,
            type:"POST",
            success:function (result) {
                buildClassTable(result);
                buildPageInfo(result);
                buildPageNav(result);
            }
        })
    };
    //解析页面
    function buildClassTable(result) {
        $("#classTableBody").empty();
        var classes = result.extend.pageInfo.list;
        $.each(classes,function (index,item) {
            var classIdTd = $("<td></td>").append(item.classId);
            var classDepartmentTd = $("<td></td>").append(item.classDepartment);
            var classDomainTd = $("<td></td>").append(item.classDomain);
            var classNameTd = $("<td></td>").append(item.className);
            var classCodeTd = $("<td></td>").append((item.classId+65536).toString(16));
            var classMessagetBtn = $("<button></button>").addClass("btn btn-warning btn-sm classAttrBtn")
                .append($("<span></span>").addClass("glyphicon glyphicon-tags")).append(" 班级信息");
            var classManagementBtn = $("<button></button>").addClass("btn btn-primary  btn-sm classManagementBtn")
                .append($("<span></span>").addClass("glyphicon glyphicon-user")).append(" 学生管理");
            var deleteBtn = $("<button></button>").addClass("btn btn-danger btn-sm deleteBtn")
                .append($("<span></span>").addClass("glyphicon glyphicon-trash")).append(" 删除班级");
            var editBtn = $("<button></button>").addClass("btn btn-info btn-sm editBtn")
                .append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append(" 修改班级");
            var btnTd = $("<td></td>").append(classManagementBtn).append(" ").append(deleteBtn).append(" ").append(editBtn).append(" ").append(classMessagetBtn);
            $("<tr></tr>").append(classIdTd)
                .append(classDepartmentTd)
                .append(classDomainTd)
                .append(classNameTd)
                .append(classCodeTd)
                .append(btnTd)
                .appendTo("#classTableBody");
        });
    };
    //解析页面导航文字信息
    function buildPageInfo(result) {
        page = result.extend.pageInfo.pageNum;
        pageEnd = result.extend.pageInfo.pages;
        $("#pageInfoArea").empty();
        $("#pageInfoArea").append("当前第 "+result.extend.pageInfo.pageNum+" 页，总 "+result.extend.pageInfo.pages+" 页，总 "+result.extend.pageInfo.total+" 个行政班级。");
    };
    //解析界面分页条
    function buildPageNav(result) {
        $("#pageNavArea").empty();
        var ul = $("<ul></ul>").addClass("pagination");
        var fristPageLi = $("<li></li>").append($("<a></a>").append("首页").attr("href","#"));
        var prePageLi = $("<li></li>").append($("<a></a>").append("&laquo;"));
        if(result.extend.pageInfo.hasPreviousPage==false){
            fristPageLi.addClass("disabled");
            prePageLi.addClass("disabled");
        }else {
            fristPageLi.click(function () {
                toPage(1);
            });
            prePageLi.click(function () {
                toPage(result.extend.pageInfo.pageNum -1);
            });
        }
        var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;"));
        var lastPageLi = $("<li></li>").append($("<a></a>").append("末页").attr("href","#"));
        if(result.extend.pageInfo.hasNextPage==false){
            nextPageLi.addClass("disabled");
            lastPageLi.addClass("disabled");
        }else {
            lastPageLi.click(function () {
                toPage(result.extend.pageInfo.pages);
            });
            nextPageLi.click(function () {
                toPage(result.extend.pageInfo.pageNum +1);
            });
        }
        ul.append(fristPageLi).append(prePageLi);
        $.each(result.extend.pageInfo.navigatepageNums,function (index,item) {
            var numLi = $("<li></li>").append($("<a></a>").append(item));
            if(result.extend.pageInfo.pageNum==item){
                numLi.addClass("active");
            }
            numLi.click(function () {
                toPage(item);
            });
            ul.append(numLi);
        });
        ul.append(nextPageLi).append(lastPageLi);
        var navEle = $("<nav></nav>").append(ul);
        navEle.appendTo("#pageNavArea");
        currentPage=result.extend.pageInfo.pageNum;
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
                    toPage(page+1);
                }
            }
        })
    });
    //班级加入弹出框
    $("#addClassBtn").click(function () {
        $("#classAddModal Form")[0].reset();
        $("#addClassName").parent().removeClass("has-error");
        $("#addClassName").next("span").text("");
        $("#classAddModal").modal({
            backdrop:"static"
        });
    });
    //任课管理弹出框
    $("#teachManagementBtn").click(function () {
        $("#teachManagementModal Form")[0].reset();
        $("#managementTeacherId").parent().removeClass("has-success has-error");
        $("#managementTeacherId").next("span").text("");
        $("#teachManagementModal").modal({
            backdrop:"static"
        });
    });
    //班级添加按钮
    $("#classModalAddBtn").click(function () {
        $.ajax({
            url:"${APP_PATH}/addclass",
            type:"POST",
            data:$("#classAddModal form").serialize(),
            success:function (result) {
                if(result.code==666){
                    $("#classAddModal").modal("hide");
                    toPage(page+1)
                }else if(result.code==555){
                    $("#addClassName").parent().addClass("has-error");
                    $("#addClassName").next("span").text(result.extend.msg);
                }
            }
        })
    });

    $("#classModalManagementBtn").click(function () {
        if(  $("#managementTeacherId").attr("do")!=="can"){
            return;
        }
       $.ajax({
           url:"${APP_PATH}/manageclass",
           type:"POST",
           data:$("#teachManagementModal form").serialize(),
           success:function (result) {
               if(result.code==666){
                   $("#teachManagementModal").modal("hide");
                   alert(result.extend.msg);
               }else if(result.code==555){
                   alert(result.extend.msg);
               }
           }
       })
    });

    $("#managementTeacherId").change(function () {
    $.ajax({
        url:"${APP_PATH}/getteachername",
        type:"POST",
        data:"teacherId="+$(this).val(),
        success:function (result) {
            if(result.code==666){
                $("#managementTeacherId").parent().removeClass("has-success has-error");
                $("#managementTeacherId").parent().addClass("has-success");
                $("#managementTeacherId").next("span").text(result.extend.msg);
                $("#managementTeacherId").attr("do","can");
            }else if(result.code==555){
                $("#managementTeacherId").parent().removeClass("has-success has-error");
                $("#managementTeacherId").parent().addClass("has-error");
                $("#managementTeacherId").next("span").text(result.extend.msg);
            }

        }

    })
});

    //班级信息
    $(document).on("click",".classAttrBtn",function () {
        $("#classAttrModal form")[0].reset();
        var  classCode=Encrypt($(this).parents("tr").find("td:eq(0)").text());
        $.ajax({
            url:"${APP_PATH}/classattr",
            type:"POST",
            data:"classCode="+classCode,
            success:function (result) {
                if(result.code==666){
                    var teachersName=result.extend.teachersName;
                    $("#classNumber").text(result.extend.classNums);
                    if(teachersName.length>0){
                        $("#classTeachers").text(teachersName);
                    }else {
                        $("#classTeachers").text("没有任课教师");
                    }
                }
                $("#classAttrModal").modal("show");
            }
        })
    });
    //删除班级
    $(document).on("click",".deleteBtn",function () {
        if(confirm("确认删除？\n删除前请确认：\n\t该班级的教师和学生是否都已退出！")){
            var  classCode=Encrypt($(this).parents("tr").find("td:eq(0)").text());
            $.ajax({
                url:"${APP_PATH}/classattr",
                type:"POST",
                data:"classCode="+classCode,
                success:function (result) {
                    if(result.code==666){
                        var teachersName=result.extend.teachersName;
                        var classNums = result.extend.classNums;
                        if(teachersName.length>0||classNums!=0){
                            alert("请确认学生班级关系是否清理干净");
                        }else {
                            $.ajax({
                                url:"${APP_PATH}/deleteclass",
                                type:"POST",
                                data:"classCode="+classCode,
                                success:function (result) {
                                    alert("删除成功!");
                                    toPage(page+1);
                                }
                            })
                        }
                    }
                }
            })
        }
    });
    //界面跳转到学生界面
    $(document).on("click",".classManagementBtn",function () {
        var classCode = Encrypt($(this).parents("tr").find("td:eq(0)").text());
        $("#toPageClassCode").val(classCode);
        $("#toStudentPage").submit();
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
