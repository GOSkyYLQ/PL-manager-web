<%--
  Created by IntelliJ IDEA.
  User: YLQ
  Date: 2019/5/26
  Time: 12:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<style type="text/css">
    .fitem {
        margin-bottom: 10px;
    }

    .fitem label {
        display: inline-block;
        text-align: right;
        width: 100px;
        font-size: 13px;
        padding-right: 10px;
    }

    .fitem input {
        width: 160px;
    }
</style>
<table class="easyui-datagrid" id="BuildList" title="施工信息列表"
       data-options="singleSelect:false,collapsible:true,pagination:true,url:'/build/list',method:'get',pageSize:5,toolbar:toolbar">
    <thead>
    <tr>
        <th data-options="field:'ck',checkbox:true"></th>
        <th data-options="field:'id',width:100">施工信息ID</th>
        <th data-options="field:'pro_name',width:330">工程名称</th>
        <th data-options="field:'pro_header',width:140,align:'center'">项目负责人</th>
    </tr>
    </thead>
</table>
<div id="buildEditWindow" class="easyui-window" title="编辑施工信息" closed="true" style="width:60%;height:80%;padding:10px;"
     buttons="#dlg-buttons">
    <form id="form3" method="post" action="/edit-build" enctype="multipart/form-data"
          style="margin-top: 20px; margin-left: 20px;">
        <table>
            <tr>
                <td>
                    <div class="fitem">
                        <label>工程名称:</label>
                        <input name="pro_name" style="" class="easyui-textbox" editable="true"/>
                    </div>
                </td>
                <td>
                    <div class="fitem">
                        <label>工程负责人:</label>
                        <input name="pro_header" style="" class="easyui-textbox" editable="true"/>
                    </div>
                </td>
            </tr>
            <tr>
                <td style="padding-left: 50px">
                    <div id="dlg-buttons" style="display: block">
                        <%--<button  type="submit" class="easyui-linkbutton c6" iconcls="icon-ok" style="width: 90px">提交</button>--%>
                        <a id="confirm" href="javascript:void(0)" class="easyui-linkbutton c6" iconcls="icon-ok"
                           onclick="Modify()" style="width: 90px">提交</a>
                        <a href="javascript:void(0)" class="easyui-linkbutton" iconcls="icon-cancel"
                           onclick="javascript:$('#buildEditWindow').window('close')" style="width: 90px">取消</a>
                    </div>
                </td>
            </tr>
        </table>
    </form>
</div>
<div id="buildAddWindow" class="easyui-window" title="新增施工信息" closed="true"
     style="width: 30%;height: 30%;padding: 10px">
    <form class="form-horizontal" role="form" id="form" action="/add-build" method="post">
        <div class="form-group">
            <label for="pro-name" class="col-sm-2 control-label">工程名称</label>
            <input type="text" class="easyui-textbox" id="pro-name" name="pro_name"
                   placeholder="请输入工程名称">
        </div>
        <div class="form-group">
            <label for="pro-header" class="col-sm-2 control-label">工程负责人</label>
            <input type="text" class="easyui-textbox" id="pro-header" name="pro_header"
                   placeholder="请输入工程负责人">
        </div>
        &nbsp;
        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <button type="submit" class="easyui-linkbutton c6">提交</button>
            </div>
        </div>
    </form>
</div>
<script>
    function Modify() {
        $("#buildEditWindow").window("close");
    }
    $("#form").form({
        success:function () {
            $.messager.alert('提示', '新增施工信息成功!', undefined, function () {
                $("#buildList").datagrid("reload");
                $("#buildAddWindow").window("close");
            });
        }
    })

    function getSelectionsIds() {
        var buildList = $("#BuildList");
        var sels = buildList.datagrid("getSelections");
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
            $("#buildAddWindow").window('open');
        }
    }, {
        text: '编辑',
        iconCls: 'icon-edit',
        handler: function () {
            var ids = getSelectionsIds();
            if (ids.length == 0) {
                $.messager.alert('提示', '必须选择一个施工信息才能编辑!');
                return;
            }
            if (ids.indexOf(',') > 0) {
                $.messager.alert('提示', '只能选择一项施工信息!');
                return;
            }
            var data = $("#BuildList").datagrid("getSelected")
            $("#form3").form("load",{
                pro_name:data.pro_name,
                pro_header:data.pro_header
            });
            $("#buildEditWindow").window({
                onLoad: function () {
                }
            }).window("open");
        }
    }, {
        text: '删除',
        iconCls: 'icon-cancel',
        handler: function () {
            var ids = getSelectionsIds();
            if (ids.length == 0) {
                $.messager.alert('提示', '未选中!');
                return;
            }
            $.messager.confirm('确认', '确定删除ID为 ' + ids + ' 的施工信息吗？', function (r) {
                if (r) {
                    var params = {"id": ids};
                    $.post("/rest/build/delete", params, function (data) {
                        if (data.status == 200) {
                            $.messager.alert('提示', '删除成功!', undefined, function () {
                                $("#BuildList").datagrid("reload");
                            });
                        }
                    });
                }
            });
        }
    }];
</script>
