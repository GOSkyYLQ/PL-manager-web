<%--
  Created by IntelliJ IDEA.
  User: YLQ
  Date: 2019/5/27
  Time: 0:20
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
<table class="easyui-datagrid" id="ContractList" title="合同列表"
       data-options="singleSelect:false,collapsible:true,pagination:true,url:'/contract/list',method:'get',pageSize:5,toolbar:toolbar">
    <thead>
    <tr>
        <th data-options="field:'ck',checkbox:true"></th>
        <th data-options="field:'id',width:90">合同编号</th>
        <th data-options="field:'contract_name',width:220">合同名称</th>
        <th data-options="field:'sign_date',width:150,align:'center'">签订日期</th>
        <th data-options="field:'contract_amount',width:140,align:'center'">合同金额（元）</th>
        <th data-options="field:'received_amount',width:140,align:'center'">已收金额（元）</th>
        <th data-options="field:'receivable_amount',width:140,align:'center'">应收金额（元）</th>
        <th data-options="field:'payment_method',width:140,align:'center'">付款方式</th>
        <th data-options="field:'invoice_provide',width:130,align:'center'">发票是否提供</th>
    </tr>
    </thead>
</table>
<div id="ContractEditWindow" class="easyui-window" title="编辑合同" closed="true" style="width:40%;height:65%;padding:10px;"
     buttons="#dlg-buttons">
    <form id="form4" method="post" action="/edit-contract" style="margin-top: 20px; margin-left: 20px;">
        <div class="fitem">
            <label>合同编号:</label>
            <input id="bianhao" name="id" style="" class="easyui-textbox"/>
        </div>
        <div class="fitem">
            <label>合同名称:</label>
            <input id="contract_name" name="contract_name" style="" class="easyui-textbox"/>
        </div>
        <div class="fitem">
            <label>签订日期:</label>
            <input id="sign_date" name="sign_date" style="" class="easyui-datetimebox"/>
        </div>
        <div class="fitem">
            <label>合同金额（元）:</label>
            <input id="contract_amount" name="contract_amount" style="" class="easyui-textbox"/>
        </div>
        <div class="fitem">
            <label>已收金额（元）:</label>
            <input id="received_amount" name="received_amount" style="" class="easyui-textbox"/>
        </div>
        <div class="fitem">
            <label>应收金额（元）:</label>
            <input id="receivable_amount" name="receivable_amount" style="" class="easyui-textbox"/>
        </div>
        <div class="fitem">
            <label>付款方式:</label>
            <input id="payment_method" name="payment_method" style="" class="easyui-textbox"/>
        </div>
        <div class="fitem">
            <label>发票是否提供:</label>
            <input id="invoice_provide" name="invoice_provide" style="" class="easyui-textbox"/>
        </div>
        <div id="dlg-buttons" style="display: block">
            <%--<button  type="submit" class="easyui-linkbutton c6" iconcls="icon-ok" style="width: 90px">提交</button>--%>
            <a id="confirm" href="javascript:void(0)" class="easyui-linkbutton c6" iconcls="icon-ok" onclick="Modify()"
               style="width: 90px">提交</a>
            <a href="javascript:void(0)" class="easyui-linkbutton" iconcls="icon-cancel"
               onclick="javascript:$('#ContractEditWindow').window('close')" style="width: 90px">取消</a>
        </div>
    </form>
</div>
<div id="ContractAddWindow" class="easyui-window" title="新增合同" closed="true"
     style="width: 40%;height: 60%;padding: 10px">
    <form class="form-horizontal" role="form" id="form" action="/add-contract" method="post">
        <div class="form-group">
            <label for="ID" class="col-sm-2 control-label">合同编号</label>
            <%--<input  id="pro-name" name="pro_name" style="" class="easyui-combobox" data-options="valueField:'id',textField:'pro_name',--%>
            <%--url:'/loadProject',prompt:'请选择工程名称',required:true,editable:false"/>--%>
            <input type="text" class="easyui-textbox" id="ID" name="id"
                   placeholder="请输入合同编号">
        </div>
        <div class="form-group">
            <label for="contract-name" class="col-sm-2 control-label">合同名称</label>
            <input type="text" class="easyui-textbox" id="contract-name" name="contract_name"
                   placeholder="请输入合同名称">
        </div>
        <div class="form-group">
            <label for="sign-date" class="col-sm-2 control-label">签订日期</label>
            <input type="text" class="easyui-datetimebox" id="sign-date" name="sign_date"
                   placeholder="请输入签订日期">
        </div>
        <div class="form-group">
            <label for="contract-amount" class="col-sm-2 control-label">合同金额（元）</label>
            <input type="text" class="easyui-textbox" id="contract-amount" name="contract_amount"
                   placeholder="请输入合同金额">
        </div>
        <div class="form-group">
            <label for="received-amount" class="col-sm-2 control-label">已收金额</label>
            <input type="text" class="easyui-textbox" id="received-amount" name="received_amount"
                   placeholder="已收金额">
        </div>
        <div class="form-group">
            <label for="receivable-amount" class="col-sm-2 control-label">应收金额（元）</label>
            <input type="text" class="easyui-textbox" id="receivable-amount" name="receivable_amount"
                   placeholder="请输入应收金额">
        </div>
        <div class="form-group">
            <label for="payment_method" class="col-sm-2 control-label">付款方式</label>
            <input type="text" class="easyui-textbox" id="payment-method" name=payment_method"
                   placeholder="请输入付款方式">
        </div>
        <div class="form-group">
            <label for="invoice-provide" class="col-sm-2 control-label">发票是否提供</label>
            <input type="text" class="easyui-textbox" id="invoice-provide" name="invoice_provide"
                   placeholder="请输入">
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
        $("#ContractEditWindow").window("close");
    }
    $("#form").form({
        success:function () {
            $.messager.alert('提示', '新增合同成功!', undefined, function () {
                $("#ContractList").datagrid("reload");
                $("#ContractAddWindow").window("close");
            });
        }
    })
    function getSelectionsIds() {
        var itemList = $("#ContractList");
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
            $("#ContractAddWindow").window('open');
        }
    }, {
        text: '编辑',
        iconCls: 'icon-edit',
        handler: function () {
            var ids = getSelectionsIds();
            if (ids.length == 0) {
                $.messager.alert('提示', '必须选择一个合同才能编辑!');
                return;
            }
            if (ids.indexOf(',') > 0) {
                $.messager.alert('提示', '只能选择一个合同!');
                return;
            }
            var data=$("#ContractList").datagrid("getSelected");
            $("#form4").form("load",{
                id:data.id,
                contract_name:data.contract_name,
                sign_date:data.sign_date,
                contract_amount:data.contract_amount,
                received_amount:data.received_amount,
                receivable_amount:data.receivable_amount,
                payment_method:data.payment_method,
                invoice_provide:data.invoice_provide
            });
            $("#ContractEditWindow").window({
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
                $.messager.alert('提示', '未选中合同!');
                return;
            }
            $.messager.confirm('确认', '确定删除ID为 ' + ids + ' 的合同吗？', function (r) {
                if (r) {
                    var params = {"ids": ids};
                    $.post("/rest/contract/delete", params, function (data) {
                        if (data.status == 200) {
                            $.messager.alert('提示', '删除成功!', undefined, function () {
                                $("#ContractList").datagrid("reload");
                            });
                        }
                    });
                }
            });
        }
    }];
</script>
