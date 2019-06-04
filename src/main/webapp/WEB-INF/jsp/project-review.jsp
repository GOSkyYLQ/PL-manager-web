<%--
  Created by IntelliJ IDEA.
  User: YLQ
  Date: 2019/5/30
  Time: 2:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<table class="easyui-datagrid" id="projectList" title="项目列表"
       data-options="singleSelect:false,collapsible:true,pagination:true,url:'/item/review/list',method:'get',pageSize:5,toolbar:toolbar">
    <thead>
    <tr>
        <th data-options="field:'ck',checkbox:true"></th>
        <th data-options="field:'id',width:100">工程ID</th>
        <th data-options="field:'pro_name',width:300">工程名称</th>
        <th data-options="field:'pro_header',width:150,align:'center'">项目负责人</th>
        <th data-options="field:'hea_mobile',width:150,align:'center'">负责人电话</th>
        <th data-options="field:'pro_budget',width:150,align:'center'">工程预算（单位：万元）</th>
        <th data-options="field:'create_time',width:150,align:'center'">创建时间</th>
        <th data-options="field:'pro_status',width:150,align:'center'">状态</th>
    </tr>
    </thead>
</table>
<script>
    function getSelectionsIds() {
        var projectList = $("#projectList");
        var sels = projectList.datagrid("getSelections");
        var Ids = [];
        for (var i in sels) {
            Ids.push(sels[i].id);
        }
        Ids = Ids.join(",");
        return Ids;
    }

    var toolbar = [{
        text: '通过',
        iconCls: 'icon-ok',
        handler: function () {
            var id = getSelectionsIds();
            if (id.length == 0) {
                $.messager.alert('提示', '必须选择一个工程才能操作!');
                return;
            }
            if (id.indexOf(',') > 0) {
                $.messager.alert('提示', '只能选择一个工程!');
                return;
            }
            var Data = $("#projectList").datagrid("getSelected");
            $.post("/review/OK", Data, function (data) {
                if (data.status == 200) {
                    $.messager.alert('提示', '审核成功!', undefined, function () {
                        $("#projectList").datagrid("reload");
                    });
                }
            });
        }
    }, {
        text: '驳回',
        iconCls: 'icon-cancel',
        handler: function () {
            var ids = getSelectionsIds();
            if (ids.length == 0) {
                $.messager.alert('提示', '未选中项目!');
                return;
            }
            var params = {"id": ids};
            $.post("/rest/project/delete", params, function (data) {
                if (data.status == 200) {
                    $.messager.alert('提示', '审核未通过!', undefined, function () {
                        $("#projectList").datagrid("reload");
                    });
                }
            });
        }
    }];
</script>
