<%--
  Created by IntelliJ IDEA.
  User: 24652
  Date: 2019/4/9
  Time: 15:52
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
<table class="easyui-datagrid" id="UnitList" title="单位列表"
       data-options="singleSelect:false,collapsible:true,pagination:true,url:'/unit/list',method:'get',pageSize:5,toolbar:toolbar">
    <thead>
    <tr>
        <th data-options="field:'ck',checkbox:true"></th>
        <th data-options="field:'pro_name',width:300">工程名称</th>
        <th data-options="field:'unit_name',width:200,align:'center'">单位名称</th>
        <th data-options="field:'unit_address',width:250,align:'center'">单位地址</th>
        <th data-options="field:'dept',width:100,align:'center'">主管部门</th>
        <th data-options="field:'leader',width:100,align:'center'">主管领导</th>
        <th data-options="field:'lea_mobile',width:150,align:'center'">领导电话</th>
        <th data-options="field:'hea',width:100,align:'center'">负责人</th>
        <th data-options="field:'hea_mobile',width:150,align:'center'">负责人电话</th>
    </tr>
    </thead>
</table>
<div id="UnitEditWindow" class="easyui-window" title="编辑单位" closed="true" style="width:40%;height:60%;padding:10px;"
     buttons="#dlg-buttons">
    <form id="form8" method="post" action="/edit-unit" style="margin-top: 20px; margin-left: 20px;">
        <div class="fitem">
            <label>工程名称:</label>
            <input id="pro_name" name="pro_name" style="" class="easyui-textbox"/>
        </div>
        <div class="fitem">
            <label>单位名称:</label>
            <input id="unit_name" name="unit_name" style="" class="easyui-textbox"/>
        </div>
        <div class="fitem">
            <label>单位地址:</label>
            <input id="unit_address" name="unit_address" style="" class="easyui-textbox"/>
        </div>
        <div class="fitem">
            <label>主管部门:</label>
            <input id="depart" name="dept" style="" class="easyui-textbox"/>
        </div>
        <div class="fitem">
            <label>主管领导:</label>
            <input id="lea-boss" name="leader" style="" class="easyui-textbox"/>
        </div>
        <div class="fitem">
            <label>领导电话:</label>
            <input id="lea_mobile" name="lea_mobile" style="" class="easyui-textbox"/>
        </div>
        <div class="fitem">
            <label>负责人:</label>
            <input id="header" name="hea" style="" class="easyui-textbox"/>
        </div>
        <div class="fitem">
            <label>负责人电话:</label>
            <input id="hea_mobile" name="hea_mobile" style="" class="easyui-textbox"/>
        </div>
        <div id="dlg-buttons" style="display: block">
            <%--<button  type="submit" class="easyui-linkbutton c6" iconcls="icon-ok" style="width: 90px">提交</button>--%>
            <a id="confirm" href="javascript:void(0)" class="easyui-linkbutton c6" iconcls="icon-ok" onclick="Modify()"
               style="width: 90px">提交</a>
            <a href="javascript:void(0)" class="easyui-linkbutton" iconcls="icon-cancel"
               onclick="javascript:$('#UnitEditWindow').window('close')" style="width: 90px">取消</a>
        </div>
    </form>
</div>
<div id="UnitAddWindow" class="easyui-window" title="新增单位" closed="true" style="width: 40%;height: 50%;padding: 10px">
    <form class="form-horizontal" role="form" id="form" action="/add-unit" method="post">
        <div class="form-group">
            <label for="pro-name" class="col-sm-2 control-label">工程名称</label>
            <input type="text" class="easyui-textbox" id="pro-name" name="pro_name"
                   placeholder="请输入工程名称">
        </div>
        <div class="form-group">
            <label for="unit-name" class="col-sm-2 control-label">单位名称</label>
            <input type="text" class="easyui-textbox" id="unit-name" name="unit_name"
                   placeholder="请输入单位名称">
        </div>
        <div class="form-group">
            <label for="unit-address" class="col-sm-2 control-label">单位地址</label>
            <input type="text" class="easyui-textbox" id="unit-address" name="unit_address"
                   placeholder="请输入单位地址">
        </div>
        <div class="form-group">
            <label for="Dept" class="col-sm-2 control-label">主管部门</label>
            <input type="text" class="easyui-textbox" id="Dept" name="dept"
                   placeholder="请输入主管部门">
        </div>
        <div class="form-group">
            <label for="Leader" class="col-sm-2 control-label">主管领导</label>
            <input type="text" class="easyui-textbox" id="Leader" name="leader"
                   placeholder="请输入主管领导">
        </div>
        <div class="form-group">
            <label for="lea-mobile" class="col-sm-2 control-label">领导电话</label>
            <input type="text" class="easyui-textbox" id="lea-mobile" name="lea_mobile"
                   placeholder="请输入领导电话">
        </div>
        <div class="form-group">
            <label for="Hea" class="col-sm-2 control-label">负责人</label>
            <input type="text" class="easyui-textbox" id="Hea" name="hea"
                   placeholder="请输入负责人">
        </div>
        <div class="form-group">
            <label for="hea-mobile" class="col-sm-2 control-label">负责人电话</label>
            <input type="text" class="easyui-textbox" id="hea-mobile" name="hea_mobile"
                   placeholder="请输入负责人电话">
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
        $("#UnitEditWindow").window("close");
    }
    $("#form").form({
        success:function () {
            $.messager.alert('提示', '新增单位成功!', undefined, function () {
                $("#UnitList").datagrid("reload");
                $("#UnitAddWindow").window("close");
            });
        }
    })
    function getSelectionsIds() {
        var itemList = $("#UnitList");
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
            $("#UnitAddWindow").window('open');
        }
    }, {
        text: '编辑',
        iconCls: 'icon-edit',
        handler: function () {
            var ids = getSelectionsIds();
            if (ids.length == 0) {
                $.messager.alert('提示', '必须选择一个单位才能编辑!');
                return;
            }
            if (ids.indexOf(',') > 0) {
                $.messager.alert('提示', '只能选择一个单位!');
                return;
            }
            var data=$("#UnitList").datagrid("getSelected");
            $("#form8").form("load",{
                pro_name:data.pro_name,
                unit_name:data.unit_name,
                unit_address:data.unit_address,
                dept:data.dept,
                leader:data.leader,
                lea_mobile:data.lea_mobile,
                hea:data.hea,
                hea_mobile:data.hea_mobile
            })
            $("#UnitEditWindow").window({
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
                $.messager.alert('提示', '未选中单位!');
                return;
            }
            $.messager.confirm('确认', '确定删除ID为 ' + ids + ' 的单位吗？', function (r) {
                if (r) {
                    var params = {"ids": ids};
                    $.post("/rest/unit/delete", params, function (data) {
                        if (data.status == 200) {
                            $.messager.alert('提示', '删除单位成功!', undefined, function () {
                                $("#UnitList").datagrid("reload");
                            });
                        }
                    });
                }
            });
        }
    }];
</script>
