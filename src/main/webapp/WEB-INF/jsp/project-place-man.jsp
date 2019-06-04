<%--
  Created by IntelliJ IDEA.
  User: YLQ
  Date: 2019/5/26
  Time: 15:55
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
<table class="easyui-datagrid" id="PlaceList" title="项目所在地列表"
       data-options="singleSelect:false,collapsible:true,pagination:true,url:'/place/list',method:'get',pageSize:5,toolbar:toolbar">
    <thead>
    <tr>
        <th data-options="field:'ck',checkbox:true"></th>
        <th data-options="field:'pro_name',width:310">工程名称</th>
        <th data-options="field:'pro_place',width:210,align:'center'">所在地名称</th>
        <th data-options="field:'contact_way',width:150,align:'center'">联系方式</th>
        <th data-options="field:'superior_dept',width:140,align:'center'">上级主管部门</th>
        <th data-options="field:'dept_leader',width:140,align:'center'">部门负责人</th>
        <th data-options="field:'note',width:180,align:'center'">备注信息</th>
    </tr>
    </thead>
</table>
<div id="PlaceEditWindow" class="easyui-window" title="编辑单位" closed="true" style="width:40%;height:60%;padding:10px;"
     buttons="#dlg-buttons">
    <form id="form7" method="post" action="/edit-place" style="margin-top: 20px; margin-left: 20px;">
        <div class="fitem">
            <label>工程名称:</label>
            <input id="pro_name" name="pro_name" style="" class="easyui-textbox"/>
        </div>
        <div class="fitem">
            <label>所在地名称:</label>
            <input id="pro_place" name="pro_place" style="" class="easyui-textbox"/>
        </div>
        <div class="fitem">
            <label>联系方式:</label>
            <input id="contact_way" name="contact_way" style="" class="easyui-textbox"/>
        </div>
        <div class="fitem">
            <label>上级主管部门:</label>
            <input id="superior_dept" name="superior_dept" style="" class="easyui-textbox"/>
        </div>
        <div class="fitem">
            <label>部门负责人:</label>
            <input id="dept_leader" name="dept_leader" style="" class="easyui-textbox"/>
        </div>
        <div class="fitem">
            <label>备注信息:</label>
            <input id="inote" name="note" style="" class="easyui-textbox"/>
        </div>
        <div id="dlg-buttons" style="display: block">
            <%--<button  type="submit" class="easyui-linkbutton c6" iconcls="icon-ok" style="width: 90px">提交</button>--%>
            <a id="confirm" href="javascript:void(0)" class="easyui-linkbutton c6" iconcls="icon-ok" onclick="Modify()"
               style="width: 90px">提交</a>
            <a href="javascript:void(0)" class="easyui-linkbutton" iconcls="icon-cancel"
               onclick="javascript:$('#PlaceEditWindow').window('close')" style="width: 90px">取消</a>
        </div>
    </form>
</div>
<div id="PlaceAddWindow" class="easyui-window" title="新增单位" closed="true" style="width: 30%;height: 40%;padding: 10px">
    <form class="form-horizontal" role="form" id="form" action="/add-place" method="post">
        <div class="form-group">
            <label for="pro-name" class="col-sm-2 control-label">工程名称</label>
            <%--<input  id="pro-name" name="pro_name" style="" class="easyui-combobox" data-options="valueField:'id',textField:'pro_name',--%>
            <%--url:'/loadProject',prompt:'请选择工程名称',required:true,editable:false"/>--%>
            <input type="text" class="easyui-textbox" id="pro-name" name="pro_name"
                   placeholder="请输入工程名称">
        </div>
        <div class="form-group">
            <label for="pro-place" class="col-sm-2 control-label">所在地名称</label>
            <input type="text" class="easyui-textbox" id="pro-place" name="pro_place"
                   placeholder="请输入单位名称">
        </div>
        <div class="form-group">
            <label for="contact-way" class="col-sm-2 control-label">联系方式</label>
            <input type="text" class="easyui-textbox" id="contact-way" name="contact_way"
                   placeholder="请输入单位地址">
        </div>
        <div class="form-group">
            <label for="superior-dept" class="col-sm-2 control-label">上级主管部门</label>
            <input type="text" class="easyui-textbox" id="superior-dept" name="superior_dept"
                   placeholder="请输入上级主管部门">
        </div>
        <div class="form-group">
            <label for="dept-leader" class="col-sm-2 control-label">部门负责人</label>
            <input type="text" class="easyui-textbox" id="dept-leader" name="dept_leader"
                   placeholder="请输入部门负责人">
        </div>
        <div class="form-group">
            <label for="Note" class="col-sm-2 control-label">备注信息</label>
            <input type="text" class="easyui-textbox" id="Note" name="note"
                   placeholder="请输入备注信息">
        </div>
        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <button type="submit" class="easyui-linkbutton c6">提交</button>
            </div>
        </div>
    </form>
</div>
<script>
    function Modify() {
        $("#PlaceEditWindow").window("close");
    }
    $("#form").form({
        success:function () {
            $.messager.alert('提示', '新增项目所在地成功!', undefined, function () {
                $("#PlaceList").datagrid("reload");
                $("#PlaceAddWindow").window("close");
            });
        }
    })
    function getSelectionsIds() {
        var itemList = $("#PlaceList");
        var sels = itemList.datagrid("getSelections");
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
            $("#PlaceAddWindow").window('open');
        }
    }, {
        text: '编辑',
        iconCls: 'icon-edit',
        handler: function () {
            var ids = getSelectionsIds();
            if (ids.length == 0) {
                $.messager.alert('提示', '必须选择一个所在地才能编辑!');
                return;
            }
            if (ids.indexOf(',') > 0) {
                $.messager.alert('提示', '只能选择一个所在地!');
                return;
            }
            var data=$("#PlaceList").datagrid("getSelected");
            $("#form7").form("load",{
                pro_name:data.pro_name,
                pro_place:data.pro_place,
                contact_way:data.contact_way,
                superior_dept:data.superior_dept,
                dept_leader:data.dept_leader,
                note:data.note
            });
            $("#PlaceEditWindow").window({
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
                $.messager.alert('提示', '未选中所在地!');
                return;
            }
            $.messager.confirm('确认', '确定删除ID为 ' + ids + ' 的所在地吗？', function (r) {
                if (r) {
                    var params = {"ids": ids};
                    $.post("/rest/place/delete", params, function (data) {
                        if (data.status == 200) {
                            $.messager.alert('提示', '删除成功!', undefined, function () {
                                $("#PlaceList").datagrid("reload");
                            });
                        }
                    });
                }
            });
        }
    }];
</script>
