<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/4/1/001
  Time: 15:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style type="text/css">
    .fitem {
        margin-bottom: 10px;
    }

    .fitem label {
        display: inline-block;
        text-align: right;
        width: 80px;
        font-size: 13px;
        padding-right: 10px;
    }

    .fitem input {
        width: 160px;
    }
</style>
<table class="easyui-datagrid" id="ProjectList" title="项目列表"
       data-options="singleSelect:false,collapsible:true,pagination:true,url:'/item/list',method:'get',pageSize:5,toolbar:toolbar">
    <thead>
    <tr>
        <th data-options="field:'ck',checkbox:true"></th>
        <th data-options="field:'id',width:100">工程ID</th>
        <th data-options="field:'pro_name',width:380">工程名称</th>
        <th data-options="field:'pro_header',width:150,align:'center'">项目负责人</th>
        <th data-options="field:'hea_mobile',width:150,align:'center'">负责人电话</th>
        <th data-options="field:'pro_budget',width:150,align:'center'">工程预算（单位：万元）</th>
        <th data-options="field:'create_time',width:150,align:'center'">创建时间</th>
        <th data-options="field:'pro_status',width:150,align:'center'">状态</th>
    </tr>
    </thead>
</table>
<div id="projectEditWindow" class="easyui-window" title="编辑项目" closed="true" style="width:40%;height:60%;padding:10px;"
     buttons="#dlg-buttons">
    <form id="form1" method="post" action="/edit-project" style="margin-top: 20px; margin-left: 20px;">
        <div class="fitem">
            <label>工程ID:</label>
            <input id="id" name="id" class="easyui-textbox" editable="false"/>
        </div>
        <div class="fitem">
            <label>工程名称:</label>
            <input id="pro_name" name="pro_name" class="easyui-textbox" editable="true"/>
        </div>
        <div class="fitem">
            <label>项目负责人:</label>
            <input id="pro_header" name="pro_header" class="easyui-textbox" editable="true"/>
        </div>
        <div class="fitem">
            <label>负责人电话:</label>
            <input id="hea_mobile" name="hea_mobile" class="easyui-textbox" editable="true"/>
        </div>
        <div class="fitem">
            <label>工程预算（单位：万元）:</label>
            <input id="pro_budget" name="pro_budget" class="easyui-textbox" editable="true"/>
        </div>
        <div id="dlg-buttons" style="display: block">
            <button  type="submit" class="easyui-linkbutton c6" iconcls="icon-ok" style="width: 90px">提交</button>
            <%--<a id="confirm" href="javascript:void(0)" class="easyui-linkbutton c6" iconcls="icon-ok" style="width: 90px">提交</a>--%>
            <a href="javascript:void(0)" class="easyui-linkbutton" iconcls="icon-cancel"
               onclick="javascript:$('#projectEditWindow').window('close')" style="width: 90px">取消</a>
        </div>
    </form>
</div>
<div id="projectAddWindow" class="easyui-window" title="新增项目" closed="true"
     style="width: 40%;height: 40%;padding: 10px">
    <form class="form-horizontal" id="form" role="form" action="/add-project" method="post">
        <div class="form-group">
            <label for="pro-name" class="col-sm-2 control-label">工程名字</label>
            <input type="text" class="easyui-textbox" id="pro-name" name="pro_name"
                   placeholder="请输入工程名字">
        </div>
        <div class="form-group">
            <label for="pro-header" class="col-sm-2 control-label">项目负责人</label>
            <input type="text" class="easyui-textbox" id="pro-header" name="pro_header"
                   placeholder="请输入项目负责人">
        </div>
        <div class="form-group">
            <label for="hea-mobile" class="col-sm-2 control-label">负责人电话</label>
            <input type="text" class="easyui-textbox" id="hea-mobile" name="hea_mobile"
                   placeholder="请输入负责人电话">
        </div>
        <div class="form-group">
            <label for="pro-budget" class="col-sm-2 control-label">工程预算（单位：万元）</label>
            <input type="text" class="easyui-textbox" id="pro-budget" name="pro_budget"
                   placeholder="请输入工程预算">
        </div>
        <div class="form-group">
            <label for="create-time" class="col-sm-2 control-label">创建时间</label>
            <input type="text" class="easyui-datetimebox" id="create-time" name="create_time"
                   placeholder="请输入创建时间">
        </div>
        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <button type="submit" class="easyui-linkbutton c6 ">提交</button>
            </div>
        </div>
    </form>
</div>
<script>
    $("#form").form({
        success:function () {
            $.messager.alert('提示', '等待管理员审核!', undefined, function () {
                $("#ProjectList").datagrid("reload");
                $("#projectAddWindow").window("close");
            });
        }
    })
    $("#form1").form({
        success:function () {
        $.messager.alert("提示","编辑项目成功！",undefined,function(){
                $("#ProjectList").datagrid("reload");
                $("#projectEditWindow").window("close");
             });
         }
    })
    function getSelectionsIds() {
        var projectList = $("#ProjectList");
        var sels = projectList.datagrid("getSelections");
        var ids = [];
        for (var i in sels) {
            ids.push(sels[i].id);
        }
        ids = ids.join(",");
        return ids;
    }

    var toolbar = [{
        text: '新增',
        iconCls: 'icon-add',
        handler: function () {
            $("#projectAddWindow").window('open');
        }
    }, {
        text: '编辑',
        iconCls: 'icon-edit',
        handler: function () {
            var ids = getSelectionsIds();
            if (ids.length == 0) {
                $.messager.alert('提示', '必须选择一个工程才能编辑!');
                return;
            }
            if (ids.indexOf(',') > 0) {
                $.messager.alert('提示', '只能选择一个工程!');
                return;
            }
            var data = $("#ProjectList").datagrid("getSelected");
            $("#form1").form('load',{
                id:data.id,
                pro_name:data.pro_name,
                pro_header:data.pro_header,
                hea_mobile:data.hea_mobile,
                pro_budget:data.pro_budget
            });
            $("#projectEditWindow").window('open');
        }
    }, {
        text: '删除',
        iconCls: 'icon-cancel',
        handler: function () {
            var ids = getSelectionsIds();
            if (ids.length == 0) {
                $.messager.alert('提示', '未选中项目!');
                return;
            }
            $.messager.confirm('确认', '确定删除ID为 ' + ids + ' 的项目吗？', function (r) {
                if (r) {
                    var params = {"id": ids};
                    $.post("/rest/project/delete", params, function (data) {
                        if (data.status == 200) {
                            $.messager.alert('提示', '删除项目成功!', undefined, function () {
                                $("#ProjectList").datagrid("reload");
                            });
                        }
                    });
                }
            });
        }
    }];
</script>
