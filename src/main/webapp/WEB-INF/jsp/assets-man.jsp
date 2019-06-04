<%--
  Created by IntelliJ IDEA.
  User: YLQ
  Date: 2019/5/27
  Time: 15:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style type="text/css">
    .fitem {
        margin-bottom: 10px;
    }

    .form-group {
        margin-bottom: 10px;
    }

    .form-group label {
        display: inline-block;
        text-align: right;
        width: 80px;
        font-size: 13px;
        padding-right: 10px;
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
<table class="easyui-datagrid" id="AssetsList" title="资产列表"
       data-options="singleSelect:false,collapsible:true,pagination:true,url:'/assets/list',method:'get',pageSize:5,toolbar:toolbar">
    <thead>
    <tr>
        <th data-options="field:'ck',checkbox:true"></th>
        <th data-options="field:'id',width:90">资产编号</th>
        <th data-options="field:'assets_name',width:230">资产名称</th>
        <th data-options="field:'used_dept',width:150,align:'center'">使用部门</th>
        <th data-options="field:'used_user',width:140,align:'center'">使用人</th>
        <th data-options="field:'purchase_price',width:140,align:'center'">采购单价</th>
        <th data-options="field:'purchase_date',width:140,align:'center'">采购日期</th>
        <th data-options="field:'purchase_user',width:140,align:'center'">采购人</th>
    </tr>
    </thead>
</table>
<div id="AssetsEditWindow" class="easyui-window" title="编辑资产信息" closed="true" style="width:40%;height:60%;padding:10px;"
     buttons="#dlg-buttons">
    <form id="form2" method="post" action="/edit-assets" style="margin-top: 20px; margin-left: 20px;">
        <div class="fitem">
            <label>资产编号:</label>
            <input name="id" style="" class="easyui-textbox"/>
        </div>
        <div class="fitem">
            <label>资产名称:</label>
            <input name="assets_name" style="" class="easyui-textbox"/>
        </div>
        <div class="fitem">
            <label>使用部门:</label>
            <input name="used_dept" style="" class="easyui-textbox"/>
        </div>
        <div class="fitem">
            <label>使用人</label>
            <input name="used_user" style="" class="easyui-textbox"/>
        </div>
        <div class="fitem">
            <label>采购单价:</label>
            <input id="purchase_price" name="purchase_price" style="" class="easyui-textbox"/>
        </div>
        <div class="fitem">
            <label>采购日期:</label>
            <input name="purchase_date" style="" class="easyui-datetimebox"/>
        </div>
        <div class="fitem">
            <label>采购人：</label>
            <input name="purchase_user" style="" class="easyui-textbox"/>
        </div>
        <div id="dlg-buttons" style="display: block">
            <%--<button  type="submit" class="easyui-linkbutton c6" iconcls="icon-ok" style="width: 90px">提交</button>--%>
            <a id="confirm" href="javascript:void(0)" class="easyui-linkbutton c6" iconcls="icon-ok" onclick="Modify()"
               style="width: 90px">提交</a>
            <a href="javascript:void(0)" class="easyui-linkbutton" iconcls="icon-cancel"
               onclick="javascript:$('#AssetsEditWindow').window('close')" style="width: 90px">取消</a>
        </div>
    </form>
</div>
<div id="AssetsAddWindow" class="easyui-window" title="新增资产" closed="true"
     style="width: 40%;height: 60%;padding: 10px">
    <form class="form-horizontal" role="form" id="form" action="/add-assets" method="post">
        <div class="form-group">
            <label for="ID" class="col-sm-2 control-label">资产编号</label>
            <%--<input  id="pro-name" name="pro_name" style="" class="easyui-combobox" data-options="valueField:'id',textField:'pro_name',--%>
            <%--url:'/loadProject',prompt:'请选择工程名称',required:true,editable:false"/>--%>
            <input type="text" class="easyui-textbox" id="ID" name="id"
                   placeholder="请输入资产编号">
        </div>
        <div class="form-group">
            <label for="assets-name" class="col-sm-2 control-label">资产名称</label>
            <input type="text" class="easyui-textbox" id="assets-name" name="assets_name"
                   placeholder="请输入资产名称">
        </div>
        <div class="form-group">
            <label for="used-dept" class="col-sm-2 control-label">使用部门</label>
            <input type="text" class="easyui-textbox" id="used-dept" name="used_dept"
                   placeholder="请输入使用部门">
        </div>
        <div class="form-group">
            <label for="used-user" class="col-sm-2 control-label">使用人</label>
            <input type="text" class="easyui-textbox" id="used-user" name="used_user"
                   placeholder="请输入使用人">
        </div>
        <div class="form-group">
            <label for="purchase-price" class="col-sm-2 control-label">采购单价</label>
            <input type="text" class="easyui-textbox" id="purchase-price" name="purchase_price"
                   placeholder="请输入采购单价">
        </div>
        <div class="form-group">
            <label for="purchase-date" class="col-sm-2 control-label">采购日期</label>
            <input type="text" class="easyui-datetimebox" id="purchase-date" name="purchase_date"
                   placeholder="请输入采购日期">
        </div>
        <div class="form-group">
            <label for="purchase-user" class="col-sm-2 control-label">采购人</label>
            <input type="text" class="easyui-textbox" id="purchase-user" name="purchase_user"
                   placeholder="请输入采购人">
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
        $("#AssetsEditWindow").window("close");
    }
    $("#form").form({
        success:function () {
            $.messager.alert('提示', '新增资产成功!', undefined, function () {
                $("#AssetsList").datagrid("reload");
                $("#AssetsAddWindow").window("close");
            });
        }
    })

    function getSelectionsIds() {
        var itemList = $("#AssetsList");
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
            $("#AssetsAddWindow").window('open');
        }
    }, {
        text: '编辑',
        iconCls: 'icon-edit',
        handler: function () {
            var ids = getSelectionsIds();
            if (ids.length == 0) {
                $.messager.alert('提示', '必须选择一个资产才能编辑!');
                return;
            }
            if (ids.indexOf(',') > 0) {
                $.messager.alert('提示', '只能选择一个资产!');
                return;
            }
            var data=$("#AssetsList").datagrid("getSelected");
            $("#form2").form('load',{
                id:data.id,
                assets_name:data.assets_name,
                used_dept:data.used_dept,
                used_user:data.used_user,
                purchase_price:data.purchase_price,
                purchase_date:data.purchase_date,
                purchase_user:data.purchase_user
            });
            $("#AssetsEditWindow").window({
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
                $.messager.alert('提示', '未选中资产!');
                return;
            }
            $.messager.confirm('确认', '确定删除ID为 ' + ids + ' 的资产吗？', function (r) {
                if (r) {
                    var params = {"ids": ids};
                    $.post("/rest/assets/delete", params, function (data) {
                        if (data.status == 200) {
                            $.messager.alert('提示', '删除成功!', undefined, function () {
                                $("#AssetsList").datagrid("reload");
                            });
                        }
                    });
                }
            });
        }
    }];
</script>
