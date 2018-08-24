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
    <title>管理员</title>
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
<!-- 修改弹出框 -->
<div class="modal fade" id="teacherUpdateModal" tabindex="-1" role="dialog" aria-labelledby="updateModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="updateModalLabel">教师修改</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" method="post" action="/teacher">
                    <div class="form-group">
                        <label for="updateTeacherName" class="col-sm-2 control-label">姓名</label>
                        <div class="col-sm-10">
                            <p name="teacherName" class="form-control-static" id="updateTeacherName" placeholder="教师姓名"></p>
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="updateTeacherGender1" class="col-sm-2 control-label">性别</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="teacherGender" id="updateTeacherGender1" value="M" checked="checked"> 男
                            </label>
                            <label class="radio-inline ">
                                <input type="radio" name="teacherGender" id="updateTeacherGender2" value="F"> 女
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="updateTeacherEmail" class="col-sm-2 control-label">邮箱</label>
                        <div class="col-sm-10">
                            <p name="teacherEmail" class="form-control-static" id="updateTeacherEmail" placeholder="邮箱"></p>
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="updateTeacherPassword" class="col-sm-2 control-label">密码</label>
                        <div class="col-sm-10">
                            <input type="text" name="teacherPassword" class="form-control" id="updateTeacherPassword" placeholder="登录密码"/>
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="updateTeacherPosition" class="col-sm-2 control-label">职称</label>
                        <div class="col-sm-10">
                            <input type="text" name="teacherPosition" class="form-control" id="updateTeacherPosition" placeholder="职称">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="updateTeacherDepartment" class="col-sm-2 control-label">系部</label>
                        <div class="col-sm-10">
                            <input type="text" name="teacherDepartment" class="form-control" id="updateTeacherDepartment" placeholder="系部">
                            <span class="help-block"></span>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" id="teacherUpdateBtnModal" class="btn btn-primary">更新</button>
            </div>
        </div>
    </div>
</div>
<!-- 添加弹出框 -->
<div class="modal fade" id="teacherAddModal" tabindex="-1" role="dialog" aria-labelledby="addModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="addModalLabel">教师新增</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" method="post" action="/teacher">
                    <div class="form-group">
                        <label for="inputTeacherName" class="col-sm-2 control-label">姓名</label>
                        <div class="col-sm-10">
                            <input type="text" name="teacherName" class="form-control" id="inputTeacherName" placeholder="教师姓名">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputTeacherGender1" class="col-sm-2 control-label">性别</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="teacherGender" id="inputTeacherGender1" value="M" checked="checked"> 男
                            </label>
                            <label class="radio-inline ">
                                <input type="radio" name="teacherGender" id="inputTeacherGender2" value="F"> 女
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputTeacherEmail" class="col-sm-2 control-label">邮箱</label>
                        <div class="col-sm-10">
                            <input type="Email" name="teacherEmail" class="form-control" id="inputTeacherEmail" placeholder="邮箱">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputTeacherPassword" class="col-sm-2 control-label">密码</label>
                        <div class="col-sm-10">
                            <input type="text" name="teacherPassword" class="form-control" id="inputTeacherPassword" placeholder="登录密码">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputTeacherPosition" class="col-sm-2 control-label">职称</label>
                        <div class="col-sm-10">
                            <input type="text" name="teacherPosition" class="form-control" id="inputTeacherPosition" placeholder="职称">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputTeacherDepartment" class="col-sm-2 control-label">系部</label>
                        <div class="col-sm-10">
                            <input type="text" name="teacherDepartment" class="form-control" id="inputTeacherDepartment" placeholder="系部">
                            <span class="help-block"></span>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" id="teacherAddBtnModal" class="btn btn-primary">保存</button>
            </div>
        </div>
    </div>
</div>
<!-- 表格体 -->
<div class="jumbotron">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <h1>你好 管理员</h1>
                <h2>在这里你将有权限管理教师。</h2>
                <p>@Wangzl</p>
            </div>
        </div>


        <!--操作按钮-->
        <div class="row">
            <div class="col-md-4 col-md-offset-9">
                <button class="btn btn-warning " id="signOutBtn"> <span class="glyphicon glyphicon-share" aria-hidden="true"></span> 登出</button>
                <button class="btn btn-success "  id="addTeacherBtn"> <span class="glyphicon glyphicon-plus" aria-hidden="true"></span> 新增</button>
                <button class="btn btn-danger " id="deletePageAllBtn"> <span class="glyphicon glyphicon-trash" aria-hidden="true"></span> 删除</button>
            </div>
        </div>
        <div class="row"><br/></div>
        <!--教师表格-->
        <div class="row">
            <!--教职工的展示-->
            <div class="col-md-12">
                <table class="table table-hover" id="teacherTable">
                    <thead>
                        <tr class="warning">
                            <th><input type="checkbox" id="checkAll"/></th>
                            <th>☁</th>
                            <th>编号</th>
                            <th>教师姓名</th>
                            <th>性别</th>
                            <th>邮箱</th>
                            <th>登录密码</th>
                            <th>职称</th>
                            <th>系部</th>
                            <th>操作</th>
                        </tr>
                    </thead>
                   <tbody id="teacherTableBody">
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

<form id="reqForm" action="/register" method="post">
    <input type="hidden" id="reqEmail" name="email" value="">
    <input type="hidden" id="reqPassword" name="password" value=""/>
</form>

<form id="reqClassForm" action="/classPage" method="post">
    <input type="hidden" id="reqestCode" name="reqestCode" value="">
</form>

</body>
</html>


<script type="text/javascript">
    var currentPage;
    //页面跳转的ajax请求
    function toPage(pageNum) {
        var code = Encrypt(pageNum);
        $.ajax({
            url:"${APP_PATH}/teacherlist",
            data:"requestCode="+code,
            type:"POST",
            success:function (result) {
                //解析并显示教师数据
                buildTeacherTable(result);
                //解析并显示分页信息
                buildPageInfo(result);
                //解析并显示分页条
                buildPageNav(result);
            }
        })
    };
    //解析表格信息
    function buildTeacherTable(result) {
        $("#teacherTableBody").empty();
        var teachers = result.extend.pageInfo.list;
        $.each(teachers,function (index,item) {
            if(0==item.teacherId){
                var checkBoxTd = $("<td>✪</td>").append("");
            }
            else{
                var checkBoxTd = $("<td><input type='checkbox' class = 'check_item'/></td>");
            }
            var intervalTd = $("<td></td>").append("☁");
            var teacherIdTd = $("<td></td>").append(item.teacherId);
            var teacherNameTd = $("<td></td>").append(item.teacherName);
            var teacherGenderTd = $("<td></td>").append(item.teacherGender);
            var teacherEmailTd = $("<td></td>").append(item.teacherEmail);
            var teacherPasswordTd = $("<td></td>").append(item.teacherPassword);
            var teacherPositionTd = $("<td></td>").append(item.teacherPosition);
            var teacherDepartmentTd = $("<td></td>").append(item.teacherDepartment);
            var classManagementTd = $("<button></button>").addClass("btn btn-warning btn-sm classManagementBtn")
                .append($("<span></span>").addClass("glyphicon glyphicon-user")).append(" 班级管理");
            var deleteTd = $("<button></button>").addClass("btn btn-danger btn-sm deleteBtn")
                .append($("<span></span>").addClass("glyphicon glyphicon-trash")).append(" 删除");
            var editTd = $("<button></button>").addClass("btn btn-info btn-sm editBtn")
                .append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append(" 修改");
            //为编辑按钮添加自定属性，便于点击
            editTd.attr("edit-id",item.teacherId);
            var btnTd = $("<td></td>").append(classManagementTd).append(" ").append(deleteTd).append(" ").append(editTd);
            $("<tr></tr>").append(checkBoxTd).append(intervalTd)
                .append(teacherIdTd)
                .append(teacherNameTd)
                .append(teacherGenderTd)
                .append(teacherEmailTd)
                .append(teacherPasswordTd)
                .append(teacherPositionTd)
                .append(teacherDepartmentTd)
                .append(btnTd)
                .appendTo("#teacherTableBody");
        });
    };
    //解析页面导航文字信息
    function buildPageInfo(result) {
        $("#pageInfoArea").empty();
        $("#pageInfoArea").append("当前第 "+result.extend.pageInfo.pageNum+" 页，总 "+result.extend.pageInfo.pages+" 页，总 "+result.extend.pageInfo.total+" 名教职工。");
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
    //添加模态框信息前端验证
    function validateAddForm(){
        if(($("#teacherAddBtnModal").attr("ajax-name")!="success")){
            $("#inputTeacherName").parent().addClass("has-error");
            $("#inputTeacherName").next("span").text("教师名可以是2-6个汉字或是6-16位英文或数字的组合！");
        }
        if(($("#teacherAddBtnModal").attr("ajax-email")!="success")){
            $("#inputTeacherEmail").parent().addClass("has-error");
            $("#inputTeacherEmail").next("span").text("邮箱格式不正确！");
        }
        var teacherPosition= $("#inputTeacherPosition").val();
        var teacherDepartment= $("#inputTeacherDepartment").val();
        var teacherPassword= $("#inputTeacherPassword").val();
        var regPassword = /^[a-zA-Z0-9_-]{6,18}$/;

        $("#inputTeacherPosition").parent().removeClass("has-error has-success");
        $("#inputTeacherDepartment").parent().removeClass("has-error has-success");
        $("#inputTeacherPassword").parent().removeClass("has-error has-success");
        if(!regPassword.test(teacherPassword)){
            $("#inputTeacherPassword").parent().addClass("has-error");
            $("#inputTeacherPassword").next("span").text("密码可以6-16位英文或数字的组合！");
            return false;
        }else {
            $("#inputTeacherPassword").parent().addClass("has-success");
            $("#inputTeacherPassword").next("span").text("");
        }
        if(teacherPosition.length<=1){
            $("#inputTeacherPosition").parent().addClass("has-error");
            $("#inputTeacherPosition").next("span").text("请正确填入职称！");
            return false;
        }else {
            $("#inputTeacherPosition").parent().addClass("has-success");
            $("#inputTeacherPosition").next("span").text("");
        }
        if(teacherDepartment.length<=2){
            $("#inputTeacherDepartment").parent().addClass("has-error");
            $("#inputTeacherDepartment").next("span").text("请正确填入系部！");
            return false;
        }else {
            $("#inputTeacherDepartment").parent().addClass("has-success");
            $("#inputTeacherDepartment").next("span").text("");
        }
        return true;
    };
    //更新模态框信息前端验证
    function validateUpdateForm(){
        var teacherPosition= $("#updateTeacherPosition").val();
        var teacherDepartment= $("#updateTeacherDepartment").val();
        var teacherPassword= $("#updateTeacherPassword").val();
        var regPassword = /^[a-zA-Z0-9_-]{6,18}$/;

        $("#updateTeacherPosition").parent().removeClass("has-error has-success");
        $("#updateTeacherDepartment").parent().removeClass("has-error has-success");
        $("#updateTeacherPassword").parent().removeClass("has-error has-success");
        if(!regPassword.test(teacherPassword)){
            $("#updateTeacherPassword").parent().addClass("has-error");
            $("#updateTeacherPassword").next("span").text("密码可以6-16位英文或数字的组合！");
            return false;
        }else {
            $("#updateTeacherPassword").parent().addClass("has-success");
            $("#updateTeacherPassword").next("span").text("");
        }
        if(teacherPosition.length<=1){
            $("#updateTeacherPosition").parent().addClass("has-error");
            $("#updateTeacherPosition").next("span").text("请正确填入职称！");
            return false;
        }else {
            $("#updateTeacherPosition").parent().addClass("has-success");
            $("#updateTeacherPosition").next("span").text("");
        }
        if(teacherDepartment.length<=2){
            $("#updateTeacherDepartment").parent().addClass("has-error");
            $("#updateTeacherDepartment").next("span").text("请正确填入系部！");
            return false;
        }else {
            $("#updateTeacherDepartment").parent().addClass("has-success");
            $("#updateTeacherDepartment").next("span").text("");
        }
        return true;
    };
    //表单的完全重置
    function resetFrom(ele){
        $(ele)[0].reset(); //清除表单内容
        $(ele).find("*").removeClass("has-error has-success has-warning");  //清除表单框样式
        $(ele).find(".help-block").text("");  //清除表单提示信息
        $("#teacherAddBtnModal").attr("ajax-email","");
        $("#teacherAddBtnModal").attr("ajax-name","");
    };
    //按照教师Id获奖教师信息
    function getTeacher(teacherId){
        $.ajax({
            url:"${APP_PATH}/getteacher",
            type:"POST",
            data:"teacherId="+teacherId,
            success:function (result) {
                var teacherData = result.extend.teacher;
                $("#updateTeacherName").text(teacherData.teacherName);
                $("#updateTeacherEmail").text(teacherData.teacherEmail);
                $("#teacherUpdateModal input[name=teacherGender]").val([teacherData.teacherGender]);
                $("#updateTeacherPassword").val(teacherData.teacherPassword);
                $("#updateTeacherPosition").val(teacherData.teacherPosition);
                $("#updateTeacherDepartment").val(teacherData.teacherDepartment);
            }
        })
    };
    //页面加载完成后,要到分页数据
    $(function () {
        //去首页
        toPage(1);
    });
    //新增按钮的点击事件
    $("#addTeacherBtn").click(function () {
        //清除表单内容，包含表单的样式和表单的数据
        resetFrom("#teacherAddModal form");
        $("#teacherAddModal").modal({
            backdrop:"static"
        });
    });
    //用户名验证
    $("#inputTeacherName").change(function () {
        $("#inputTeacherName").parent().removeClass("has-error has-success has-warning");
        var teacherName = this.value;
        var regName =/(^[\u2E80-\u9FFF]{2,6}$)|(^[a-zA-Z0-9_-]{6,16})/;
        if(!regName.test(teacherName)){
            $("#inputTeacherName").parent().addClass("has-error");
            $("#inputTeacherName").next("span").text("教师名可以是2-6个汉字或是6-16位英文或数字的组合！")
            $("#teacherAddBtnModal").attr("ajax-name","error");
            return false;
        }else {
            $("#inputTeacherName").parent().addClass("has-success");
            $("#inputTeacherName").next("span").text("")
            $("#teacherAddBtnModal").attr("ajax-name","success");
        }
        $.ajax({
            url:"${APP_PATH}/checkName",
            type:"POST",
            data:"teacherName=" +teacherName,
            success:function (result) {
                if(result.code==666){
                    $("#inputTeacherName").parent().addClass("has-success");
                    $("#inputTeacherName").next("span").text("教师名有效可用！");
                    $("#teacherAddBtnModal").attr("ajax-name","success");

                }else if(result.code==909){
                    $("#inputTeacherName").parent().addClass("has-warning");
                    $("#inputTeacherName").next("span").text("警告：该教师名已存在，请核实！");
                    $("#teacherAddBtnModal").attr("ajax-name","success");
                }
            }
        })
    });
    //邮箱验证
    $("#inputTeacherEmail").change(function () {
        $("#inputTeacherEmail").parent().removeClass("has-error has-success");
        var teacherEmail = this.value;
        var regEmail =/^[a-z\d]+(\.[a-z\d]+)*@([\da-z](-[\da-z])?)+(\.{1,2}[a-z]+)+$/;
        if(!regEmail.test(teacherEmail)){
            $("#inputTeacherEmail").parent().addClass("has-error");
            $("#inputTeacherEmail").next("span").text("邮箱格式不正确！");
            $("#teacherAddBtn").attr("ajax-email","error");
            return false;
        }else {
            $("#inputTeacherEmail").parent().addClass("has-success");
            $("#inputTeacherEmail").next("span").text("");
            $("#teacherAddBtnModal").attr("ajax-email","success");
            $.ajax({
                url:"${APP_PATH}/checkemail",
                type:"POST",
                data:"teacherEmail=" +teacherEmail,
                success:function (result) {
                    if(result.code==666){
                        $("#inputTeacherEmail").parent().addClass("has-success");
                        $("#inputTeacherEmail").next("span").text("邮箱可用！");
                        $("#teacherAddBtnModal").attr("ajax-email","success");
                    }else if(result.code==555){
                        $("#inputTeacherEmail").parent().addClass("has-error");
                        $("#inputTeacherEmail").next("span").text("邮箱存在！");
                        $("#teacherAddBtnModal").attr("ajax-email","error");
                    }
                }
            })
        }
    });
    //新增模态框保存按钮
    $("#teacherAddBtnModal").click(function () {
        if(!validateAddForm()){
            return false;
        }
        if(($(this).attr("ajax-name")=="success")&&($(this).attr("ajax-email")=="success")){
            $("#inputTeacherPassword").val(Encrypt($("#inputTeacherPassword").val()));
            $.ajax({
                url:"${APP_PATH}/saveteacher",
                type:"POST",
                data: $("#teacherAddModal form").serialize(),
                success:function (result) {
                    if(result.code==666){
                        //保存成功 关闭模态框，刷新页面
                        $("#teacherAddModal").modal('hide');
                        toPage(9999);
                    }else {
                        //显示失败信息
                        //有那个字段信息有误就显示那个字段
                        if(result.extend.errorFields.teacherEmail!=undefined){
                            //显示邮箱的错误信息
                            $("#inputTeacherEmail").parent().addClass("has-error");
                            $("#inputTeacherEmail").next("span").text(result.extend.errorFields.teacherEmail);
                        }
                        if(result.extend.errorFields.teacherName!=undefined){
                            //显示姓名的错误信息
                            $("#inputTeacherName").parent().addClass("has-error");
                            $("#inputTeacherName").next("span").text(result.extend.errorFields.teacherName);
                        }
                        if(result.extend.errorFields.teacherPassword!=undefined){
                            //显示密码的错误信息
                            $("#inputTeacherPassword").parent().addClass("has-error");
                            $("#inputTeacherPassword").next("span").text(result.extend.errorFields.teacherPassword);
                        }
                    }
                }
            })
        }
        else
            return false;
    });
    //修改按钮的点击事件
    // 在创建按钮时为按钮绑定点击事件，在新版jQuery中live被取消 只能用on方法
    $(document).on("click",".editBtn",function () {
        //给按钮绑定id属性
        getTeacher($(this).attr("edit-id"));
        //将id属性传递给更新按钮
        $("#teacherUpdateBtnModal").attr("edit-id",$(this).attr("edit-id"));
        //打开模态框
        $("#teacherUpdateModal").modal({
            backdrop:"static"
        })
    });
    //删除按钮的点击事件
    $(document).on("click",".deleteBtn",function () {
        var teacherId = $(this).parents("tr").find("td:eq(2)").text();
        var teacherName = $(this).parents("tr").find("td:eq(3)").text();
        if(0==teacherId){
            alert("管理员拥有最高权限，只能修改，禁止删除");
            return;
        }
        if(confirm("确认删除【"+teacherName+"】吗？")){
            $.ajax({
                url:"${APP_PATH}/deleteteacher",
                type:"POST",
                data:"teacherId="+teacherId,
                success:function (result) {
                    if(result.code==666)
                        toPage(currentPage);
                }
            })
        }
    });
    //更新按钮的点击事件
    $("#teacherUpdateBtnModal").click(function () {

        if(!validateUpdateForm()){
            return false;
        }
        $("#updateTeacherPassword").val(Encrypt($("#updateTeacherPassword").val()));
        $.ajax({
            url:"${APP_PATH}/updateteacher",
            type:"POST",
            data: $("#teacherUpdateModal form").serialize()+"&"+"teacherId="+$(this).attr("edit-id"),
            success:function (result) {
                if(result.code==666){
                    //更新成功 关闭模态框，刷新页面
                    $("#teacherUpdateModal").modal('hide');
                    toPage(currentPage);
                }else {
                    //显示失败信息
                    //有那个字段信息有误就显示那个字段
                    if(result.extend.errorFields.teacherPassword!=undefined){
                        //显示密码格式的错误信息
                        $("#inputTeacherPassword").parent().addClass("has-error");
                        $("#inputTeacherPassword").next("span").text(result.extend.errorFields.teacherPassword);
                    }
                }
            }
        })
    });
    //完成全选全部选的功能
    $("#checkAll").click(function () {
        //attr获取checked是undefined的
        //当在需要访问dom原生的属性用prop获取 attr用于获取自定义的属性值
        $(".check_item").prop("checked",$(this).prop("checked"));
    });
    //checkItem的点击,当全部点击时，title的也要选中
    $(document).on("click",".check_item",function () {
        //当前选中的元素是不是当前页面的所有元素
        var flag=($(".check_item:checked").length==$(".check_item").length)
        $("#checkAll").prop("checked",flag);
    });
    //批量删除按钮
    $("#deletePageAllBtn").click(function () {
        var teacherNames=" | ";
        var teacherIds="";
        $.each($(".check_item:checked"),function () {
            teacherNames+=$(this).parents("tr").find("td:eq(3)").text()+" | ";
            teacherIds+=$(this).parents("tr").find("td:eq(2)").text()+"~";
        });
        teacherIds=teacherIds.substring(0,teacherIds.length-1);
        if(teacherNames.length==3){
            alert("没有选中！");
            return;
        }else
        if(confirm("确认删除\n【"+teacherNames+"】？")){
            //发送ajax请求
            $.ajax({
                url:"${APP_PATH}/deleteteacher",
                type:"POST",
                data:"teacherId="+teacherIds,
                success:function (result) {
                    alert("批量" + result.msg);
                    if (result.code == 666)
                        toPage(currentPage);
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
    //班级管理的点击事件
    $(document).on("click",".classManagementBtn",function () {
        var  teacherEmail=$(this).parents("tr").find("td:eq(5)").text();
        var  teacherPassword=$(this).parents("tr").find("td:eq(6)").text();
        if(teacherEmail=="Master@wzl.com"){
            document.getElementById("reqestCode").value="ooo00o0OOO00O0O";
            $("#reqClassForm").submit();
        }else
        $.ajax({
            url:"${APP_PATH}/getmd5key",
            type:"POST",
            success:function (result) {
                var  md5key=result.extend.md5key;
                document.getElementById("reqEmail").value = Encrypt(teacherEmail);
                document.getElementById("reqPassword").value=md5Password(teacherPassword,md5key);
                $("#reqForm").submit();
            }
        });




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
    //MD5加密
    function md5Password(text,key) {
        var md5key = text+key;
        return $.md5(md5key);
    }

</script>
