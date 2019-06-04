<%--
  Created by IntelliJ IDEA.
  User: 24652
  Date: 2019/4/30
  Time: 13:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>Bootstrap 实例 - 水平表单</title>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://unpkg.com/font-awesome@4.7.0/css/font-awesome.min.css">
</head>
<body>
<div class="errormsg"></div>
<div class="add">
    <form class="form-horizontal" role="form" action="/add-project" method="post">
        <div class="form-group">
            <label for="pro-name" class="col-sm-2 control-label">工程名字</label>
            <div class="col-sm-4">
                <input type="text" class="form-control" id="pro-name" name="pro_name"
                       placeholder="请输入工程名字">
            </div>
        </div>
        <div class="form-group">
            <label for="pro-header" class="col-sm-2 control-label">项目负责人</label>
            <div class="col-sm-4">
                <input type="text" class="form-control" id="pro-header" name="pro_header"
                       placeholder="请输入项目负责人">
            </div>
        </div>
        <div class="form-group">
            <label for="hea-mobile" class="col-sm-2 control-label">负责人电话</label>
            <div class="col-sm-4">
                <input type="text" class="form-control" id="hea-mobile" name="hea_mobile"
                       placeholder="请输入负责人电话">
            </div>
        </div>
        <div class="form-group">
            <label for="pro-budget" class="col-sm-2 control-label">工程预算（单位：万元）</label>
            <div class="col-sm-4">
                <input type="text" class="form-control" id="pro-budget" name="pro_budget"
                       placeholder="请输入工程预算">
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <button type="submit" class="btn btn-default">提交</button>
            </div>
        </div>
    </form>
</div>
</body>
</html>

<%--<script>--%>
    <%--$('.add .form-horizontal').addEventListener('submit', function(e) {--%>
        <%--$.message.alert("11")--%>
        <%--// e.preventDefault()--%>
        <%--// if (!/^1[3-578]\d{9}$/.test($('.add input[name=hea_mobile]').value)) {--%>
        <%--//     // $('.errormsg').innerText = '请输入正确的电话号码'--%>
        <%--//     alert("错误");--%>
        <%--//     return false--%>
        <%--// }--%>
        <%--// else {--%>
        <%--//     confirm("申请已提交");--%>
        <%--// }--%>
        <%--// this.submit()--%>
    <%--})--%>
<%--</script>--%>