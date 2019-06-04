<%--
  Created by IntelliJ IDEA.
  User: YLQ
  Date: 2019/5/24
  Time: 17:52
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
<table class="easyui-datagrid" id="KanceList" title="勘测信息列表"
       data-options="singleSelect:false,collapsible:true,pagination:true,url:'/kance/list',method:'get',pageSize:5,toolbar:toolbar">
    <thead>
    <tr>
        <th data-options="field:'ck',checkbox:true"></th>
        <th data-options="field:'id',width:100">勘测信息ID</th>
        <th data-options="field:'pro_name',width:330">工程名称</th>
        <th data-options="field:'pro_header',width:140,align:'center'">项目负责人</th>
        <th data-options="field:'pro_passw',width:140,align:'center'">项目密码</th>
        <th data-options="field:'group_member',width:150,align:'center'">勘测组成员</th>
        <th data-options="field:'kance_time',width:140,align:'center'">现场勘测时间</th>
        <th data-options="field:'paper_handle',width:140,align:'center'">票据办理</th>
    </tr>
    </thead>
</table>
<div id="kanceEditWindow" class="easyui-window" title="编辑勘测信息" closed="true" style="width:60%;height:80%;padding:10px;"
     buttons="#dlg-buttons">
    <form id="form6" method="post" action="/edit-kance" style="margin-top: 20px; margin-left: 20px;">
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
                <td>
                    <div class="fitem">
                        <label>项目密码:</label>
                        <input name="pro_passw" style="" class="easyui-textbox" editable="true"/>
                    </div>
                </td>
                <td>
                    <div class="fitem">
                        <label>勘测组成员:</label>
                        <input name="group_member" style="" class="easyui-textbox" editable="true"/>
                    </div>
                </td>
            </tr>
            <tr>
                <td>
                    <div class="fitem">
                        <label>现场勘测时间:</label>
                        <input name="kance_time" style="" class="easyui-datetimebox" editable="true"/>
                    </div>
                </td>
                <td>
                    <div class="fitem">
                        <label>票据办理:</label>
                        <input name="paper_handle" class="easyui-textbox" editable="true">
                    </div>
                </td>
            </tr>
            <tr>
                <td>
                    <div class="fitem">
                        <label>现场勘测资料:</label>
                        <input class="easyui-filebox" id="file1" name="file1"  data-options="prompt:'Choose a file...'" style="width:250px">
                        <a href="javascript:void(0)" onclick="imageUpload()" class="easyui-linkbutton" style="width:80px;height:25px">Upload</a>
                    </div>
                </td>
                <td>
                    <label id="ssFile"/>
                </td>
            </tr>
            <tr>
                <td style="padding-left: 50px">
                    <div id="dlg-buttons" style="display: block">
                        <%--<button  type="submit" class="easyui-linkbutton c6" iconcls="icon-ok" style="width: 90px">提交</button>--%>
                        <a id="confirm" href="javascript:void(0)" class="easyui-linkbutton c6" iconcls="icon-ok"
                           onclick="Modify()" style="width: 90px">提交</a>
                        <a href="javascript:void(0)" class="easyui-linkbutton" iconcls="icon-cancel"
                           onclick="javascript:$('#kanceEditWindow').window('close')" style="width: 90px">取消</a>
                    </div>
                </td>
            </tr>
        </table>
    </form>
</div>
<div id="kanceAddWindow" class="easyui-window" title="新增勘测信息" closed="true"
     style="width: 40%;height: 45%;padding: 10px">
    <form class="form-horizontal" role="form" id="form" action="/add-kance" method="post">
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
        <div class="form-group">
            <label for="pro-passw" class="col-sm-2 control-label">项目密码</label>
            <input type="text" class="easyui-textbox" id="pro-passw" name="pro_passw"
                   placeholder="请输入项目密码">
        </div>
        <div class="form-group">
            <label for="group-member" class="col-sm-2 control-label">勘测组成员</label>
            <input type="text" class="easyui-textbox" id="group-member" name="group_member"
                   placeholder="请输入勘测组成员">
        </div>
        <div class="form-group">
            <label for="kance-time" class="col-sm-2 control-label">现场勘测时间</label>
            <input type="text" class="easyui-datetimebox" id="kance-time" name="kance_time"
                   placeholder="请输入勘测时间">
        </div>
        <div class="form-group">
            <label for="paper-handle" class="col-sm-2 control-label">票据办理</label>
            <input type="text" class="easyui-textbox" id="paper-handle" name="paper_handle"
                   placeholder="请输入票据办理人">
        </div>
        &nbsp;
        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <button type="submit" class="easyui-linkbutton c6">提交</button>
            </div>
        </div>
    </form>
</div>
<script type="text/javascript">
    function imageUpload() {
        var file = document.getElementById("filebox_file_id_1").files[0];
        var fileName = file.name;
        document.getElementById("ssFile").innerHTML = "<span style='color: red;font-size: 13px'>文件名: " + file.name + "</span>"
        $.ajaxFileUpload({
            url : '/uploadFile', //用于文件上传的服务器端请求地址
            fileElementId : 'filebox_file_id_1', //文件上传空间的id属性
            type : 'post',
            dataType : 'text', //返回值类型 一般设置为json
            success : function(data, status) //服务器成功响应处理函数
            {
                alert("文件上传成功");

            },
            error : function(data, status, e)//服务器响应失败处理函数
            {
                alert("文件上传失败");

            }
        });
    }
    function Modify() {
        $("#kanceEditWindow").window("close");
    }
    $("#form").form({
        success:function () {
            $.messager.alert('提示', '新增勘测信息成功!', undefined, function () {
                $("#KanceList").datagrid("reload");
                $("#kanceAddWindow").window("close");
            });
        }
    })
    function getSelectionsIds() {
        var kanceList = $("#KanceList");
        var sels = kanceList.datagrid("getSelections");
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
            $("#kanceAddWindow").window('open');
        }
    }, {
        text: '编辑',
        iconCls: 'icon-edit',
        handler: function () {
            var ids = getSelectionsIds();
            if (ids.length == 0) {
                $.messager.alert('提示', '必须选择一个勘测信息才能编辑!');
                return;
            }
            if (ids.indexOf(',') > 0) {
                $.messager.alert('提示', '只能选择一项勘测信息!');
                return;
            }
            var data = $("#KanceList").datagrid("getSelected");
            $("#form6").form("load",{
                pro_name:data.pro_name,
                pro_header:data.pro_header,
                pro_passw:data.pro_passw,
                group_member:data.group_member,
                kance_time:data.kance_time,
                paper_handle:data.paper_handle
            });
            $("#kanceEditWindow").window({
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
            $.messager.confirm('确认', '确定删除ID为 ' + ids + ' 的勘测信息吗？', function (r) {
                if (r) {
                    var params = {"id": ids};
                    $.post("/rest/kance/delete", params, function (data) {
                        if (data.status == 200) {
                            $.messager.alert('提示', '删除成功!', undefined, function () {
                                $("#KanceList").datagrid("reload");
                            });
                        }
                    });
                }
            });
        }
    }];
</script>
