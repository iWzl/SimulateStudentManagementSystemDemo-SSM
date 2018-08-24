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
    <title>学生页面</title>
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


<!-- 添加弹出框 -->
<div class="modal fade" id="studentAddModal" tabindex="-1" role="dialog" aria-labelledby="addModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="addModalLabel"></h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" method="post">
                    <div class="form-group">
                        <label for="inputStudentName" class="col-sm-2 control-label">姓名</label>
                        <div class="col-sm-10">
                            <input type="text" name="studentName" class="form-control" id="inputstudentName" placeholder="学生姓名">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputStudentGender1" class="col-sm-2 control-label">性别</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="studentGender" id="inputStudentGender1" value="M" checked="checked"> 男
                            </label>
                            <label class="radio-inline ">
                                <input type="radio" name="studentGender" id="inputStudentGender2" value="F"> 女
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputStudentNational" class="col-sm-2 control-label">民族</label>
                        <div class="col-sm-10">
                            <input type="text" name="studentNational" class="form-control" id="inputStudentNational" placeholder="民族">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputStudentPassword" class="col-sm-2 control-label">密码</label>
                        <div class="col-sm-10">
                            <input type="text" name="studentPassword" class="form-control" id="inputstudentPassword" placeholder="登录密码">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputStudentAddress" class="col-sm-2 control-label">地址</label>
                        <div class="col-sm-10">
                            <input type="text" name="studentAddress" class="form-control" id="inputStudentAddress" placeholder="家庭住址">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputStudentEnrollmentTime" class="col-sm-2 control-label">入学时间</label>
                        <div class="col-sm-10">
                            <input type="text" name="studentEnrollmentTime" class="form-control" id="inputStudentEnrollmentTime" placeholder="入学时间">
                            <span class="help-block"></span>
                        </div>
                    </div>
                        <input type="hidden" name="studentClassId" value=${classId}>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" id="studentAddBtnModal" class="btn btn-primary">保存</button>
            </div>
        </div>
    </div>
</div>

<!-- 表格体 -->
<div class="jumbotron">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <h1 id="title_class_name"></h1>
                <h2 id="title_class_department"></h2>
            </div>
        </div>


        <!--操作按钮-->
        <div class="row">
            <div class="col-md-4 col-md-offset-9">
                <button class="btn btn-warning " id="signOutBtn"> <span class="glyphicon glyphicon-share" aria-hidden="true"></span> 登出</button>
                <button class="btn btn-success "  id="addStudentBtn"> <span class="glyphicon glyphicon-plus" aria-hidden="true"></span> 新增</button>
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
                        <th>姓名</th>
                        <th>性别</th>
                        <th>密码</th>
                        <th>民族</th>
                        <th>地址</th>
                        <th>入学时间</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody id="studentTableBody">
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


</body>
</html>


<script type="text/javascript">
    var currentPage;
    var classId = ${classId}
    //请求数据
    $(function () {
        var code = Encrypt(classId);
        toPage(1);
        $.ajax({
            url:"${APP_PATH}/getclass",
            type:"POST",
            data:"requestCode="+code,
            success:function (result) {
                var classData = result.extend.class;
                $("#title_class_name").text(classData.classDomain+" "+classData.className);
                $("#title_class_department").text(classData.classDepartment+"\t@Wangzl");
            }
        })
    });
    //页面跳转的ajax请求
    function toPage(pageNum) {
        var code = Encrypt(pageNum);
        var id = Encrypt(classId);
        $.ajax({
            url:"${APP_PATH}/getallstudent",
            data:"requestCode="+code+"&requestId="+id,
            type:"POST",
            success:function (result) {
                //解析并显示数据
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
        $("#studentTableBody").empty();
        var students = result.extend.pageInfo.list;
        $.each(students,function (index,item) {
            var checkBoxTd = $("<td><input type='checkbox' class = 'check_item'/></td>");
            var intervalTd = $("<td></td>").append("☁");
            var studentIdTd = $("<td></td>").append(item.studentId);
            var studentNameTd = $("<td></td>").append(item.studentName);
            var studentGenderTd = $("<td></td>").append(item.studentGender);
            var studentPasswordTd = $("<td></td>").append(item.studentPassword);
            var studentNationalTd = $("<td></td>").append(item.studentNational);
            var studentAddressTd = $("<td></td>").append(item.studentAddress);
            var studentEnrollmentTimeTd = $("<td></td>").append(item.studentEnrollmentTime);
            var deleteTd = $("<button></button>").addClass("btn btn-danger btn-sm deleteBtn")
                .append($("<span></span>").addClass("glyphicon glyphicon-trash")).append(" 删除");
            var editTd = $("<button></button>").addClass("btn btn-info btn-sm editBtn")
                .append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append(" 修改");
            //为编辑按钮添加自定属性，便于点击
            var btnTd = $("<td></td>").append(deleteTd).append(" ").append(editTd);
            $("<tr></tr>").append(checkBoxTd).append(intervalTd)
                .append(studentIdTd)
                .append(studentNameTd)
                .append(studentGenderTd)
                .append(studentPasswordTd)
                .append(studentNationalTd)
                .append(studentAddressTd)
                .append(studentEnrollmentTimeTd)
                .append(btnTd)
                .appendTo("#studentTableBody");
        });
    };
    //解析页面导航文字信息
    function buildPageInfo(result) {
        $("#pageInfoArea").empty();
        $("#pageInfoArea").append("当前第 "+result.extend.pageInfo.pageNum+" 页，总 "+result.extend.pageInfo.pages+" 页，总 "+result.extend.pageInfo.total+" 名学生。");
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
    //删除按钮的点击
    $(document).on("click",".deleteBtn",function () {
        var code=Encrypt($(this).parents("tr").find("td:eq(2)").text());
       if(confirm("确认删除该学生？")){
           $.ajax({
               url:"${APP_PATH}/deletestudent",
               type:"POST",
               data:"studentCode="+code,
               success:function (result) {
                   toPage(currentPage);
               }
           })
       }
    });
    //添加框的弹出
    $("#addStudentBtn").click(function () {
        $("#studentAddModal form")[0].reset();
        $("#studentAddModal form").find("*").removeClass("has-error has-success has-warning");
        $("#studentAddModal form").find(".help-block").text("");  //清除表单提示信息
        $("#studentAddBtnModal").attr("studentCode","-1");
        $("#addModalLabel").text("学生添加");
        $("#studentAddModal").modal({  backdrop:"static"});
    });
    //学生信息的保存
    $("#studentAddBtnModal").click(function () {
        var studentCode =  $("#studentAddBtnModal").attr("studentCode");
        if(studentCode=="-1"){
            $.ajax({
                url:"${APP_PATH}/savastudent",
                type:"POST",
                data:$("#studentAddModal form").serialize(),
                success:function (result) {
                    if(result.code==666){
                        $("#studentAddModal").modal("hide");
                        toPage(666);
                    }else if(result.code==555){
                        alert("学生已存在！");
                    }
                }
            })
        }else {
            studentCode = Encrypt(studentCode);
            $.ajax({
                url:"${APP_PATH}/editstudent",
                type:"POST",
                data:$("#studentAddModal form").serialize()+"&studentCode="+studentCode,
                success:function (result) {
                    if(result.code==666){
                        $("#studentAddModal").modal("hide");
                        toPage(currentPage);
                    }
                }
            })
        }
    });
    //学生信息修改框的弹出
    $(document).on("click",".editBtn",function () {
       var studentCode = Encrypt($(this).parents("tr").find("td:eq(2)").text());
       $.ajax({
           url:"${APP_PATH}/getstudent",
           type:"POST",
           data:"studentCode="+studentCode,
           success:function (result) {
               var studentData = result.extend.student;
               $("#studentAddBtnModal").attr("studentCode",studentData.studentId);
               $("#addModalLabel").text("学生修改");
               $("#inputstudentName").val(studentData.studentName);
               $("#studentAddModal input[name=studentGender]").val([studentData.studentGender]);
               $("#inputstudentPassword").val(studentData.studentPassword);
               $("#inputStudentNational").val(studentData.studentNational);
               $("#inputStudentAddress").val(studentData.studentAddress);
               $("#inputStudentEnrollmentTime").val(studentData.studentEnrollmentTime);
               $("#studentAddModal").modal("show");
           }
       })
    });
    //登出按钮的监听事件
    $("#signOutBtn").click(function () {
        if (confirm("你确定要注销吗？")){
            window.location.href="${APP_PATH}/index.jsp"
        }
    });
    //批量删除按钮
    $("#deletePageAllBtn").click(function () {
        var studentNames=" | ";
        var studentIds="";
        $.each($(".check_item:checked"),function () {
            studentNames+=$(this).parents("tr").find("td:eq(3)").text()+" | ";
            studentIds+=$(this).parents("tr").find("td:eq(2)").text()+"~";
        });
        studentIds=studentIds.substring(0,studentIds.length-1);
        if(studentNames.length==3){
            alert("没有选中！");
            return;
        }else
        if(confirm("确认删除\n【"+studentNames+"】？")){
            //发送ajax请求
            $.ajax({
                url:"${APP_PATH}/deletestudent",
                type:"POST",
                data:"studentCode="+Encrypt(studentIds),
                success:function (result) {
                    alert("批量" + result.msg);
                    if (result.code == 666)
                        toPage(currentPage);
                }
            });
        }
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
