<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/4/1/001
  Time: 15:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<table class="easyui-datagrid" id="ProjectList" title="项目列表" toolbar="#tb"
       data-options="singleSelect:false,collapsible:true,pagination:true,url:'/item/list',method:'get',pageSize:5,toolbar:toolbar">
    <thead>
    <tr>
        <th data-options="field:'ck',checkbox:true"></th>
        <th data-options="field:'id',width:100">工程ID</th>
        <th data-options="field:'pro_name',width:380">工程名称</th>
        <th data-options="field:'pro_header',width:150,align:'center'">项目负责人</th>
        <th data-options="field:'hea_mobile',width:150,align:'center'">负责人电话</th>
        <th data-options="field:'create_time',width:170,align:'center',formatter:TAOTAO.formatDateTime">创建时间</th>
    </tr>
    </thead>
</table>
<div style="background-color: #CCDCF7;width:1725px;padding: 5px" id="tb">
    <form>
        <span style="font-size:14px">工程名称</span>&nbsp;&nbsp;
        <input type="text" name="proj-name" id="proj-name" placeholder="输入查询关键字">&nbsp;&nbsp;
        <span style="font-size:14px">项目负责人</span>&nbsp;&nbsp;
        <input type="text" name="proj-header" id="proj-header" placeholder="输入查询关键字">&nbsp;&nbsp;
        <a href="#" class="easyui-linkbutton" plain="true" onclick="doSearch()">查询</a>
        <%--<button type="submit" value="add" class="active-event" style="float: right;background-color:#7FB1F5">添加防雷项目</button>--%>
    </form>
</div>
<div id="projectEditWindow" class="easyui-window" title="编辑项目" data-options="modal:true,closed:true,iconCls:'icon-save',href:'/rest/page/item-edit'" style="width:80%;height:80%;padding:10px;">
</div>
<div id="projectAddWindow" class="easyui-window" title="新增项目" data-options="modal:true,closed:true,iconCls:'icon-save',href:'/rest/page/item-edit'" style="width:80%;height:80%;padding:10px;">
</div>

<script>
    function doSearch() {
        $('#ProjectList').datagrid('load',{
            pro_name: $('pro_name').val(),
            pro_header: $('pro_header').val()
        });
    }

    function getSelectionsIds(){
        var projectList = $("#ProjectList");
        var sels = projectList.datagrid("getSelections");
        var ids = [];
        for(var i in sels){
            ids.push(sels[i].id);
        }
        ids = ids.join(",");
        return ids;
    }

    var toolbar = [{
        text:'新增',
        iconCls:'icon-add',
        handler:function(){
            $(".tree-title:contains('新增项目')").parent().click();
        }
    },{
        text:'编辑',
        iconCls:'icon-edit',
        handler:function(){
            var ids = getSelectionsIds();
            if(ids.length == 0){
                $.messager.alert('提示','必须选择一个工程才能编辑!');
                return ;
            }
            if(ids.indexOf(',') > 0){
                $.messager.alert('提示','只能选择一个工程!');
                return ;
            }

            $("#projectEditWindow").window({
                onLoad :function(){
                    //回显数据
                    var data = $("#ProjectList").datagrid("getSelections")[0];
                    //data.priceView = TAOTAO.formatPrice(data.price);
                    $("#itemeEditForm").form("load",data);

                    // // 加载商品描述
                    // $.getJSON('/rest/item/query/item/desc/'+data.id,function(_data){
                    //     if(_data.status == 200){
                    //         //UM.getEditor('itemeEditDescEditor').setContent(_data.data.itemDesc, false);
                    //         itemEditEditor.html(_data.data.itemDesc);
                    //     }
                    // });

                    //加载商品规格
                    // $.getJSON('/rest/item/param/item/query/'+data.id,function(_data){
                    //     if(_data && _data.status == 200 && _data.data && _data.data.paramData){
                    //         $("#itemeEditForm .params").show();
                    //         $("#itemeEditForm [name=itemParams]").val(_data.data.paramData);
                    //         $("#itemeEditForm [name=itemParamId]").val(_data.data.id);
                    //
                    //         //回显商品规格
                    //         var paramData = JSON.parse(_data.data.paramData);
                    //
                    //         var html = "<ul>";
                    //         for(var i in paramData){
                    //             var pd = paramData[i];
                    //             html+="<li><table>";
                    //             html+="<tr><td colspan=\"2\" class=\"group\">"+pd.group+"</td></tr>";
                    //
                    //             for(var j in pd.params){
                    //                 var ps = pd.params[j];
                    //                 html+="<tr><td class=\"param\"><span>"+ps.k+"</span>: </td><td><input autocomplete=\"off\" type=\"text\" value='"+ps.v+"'/></td></tr>";
                    //             }
                    //
                    //             html+="</li></table>";
                    //         }
                    //         html+= "</ul>";
                    //         $("#itemeEditForm .params td").eq(1).html(html);
                    //     }
                    // });
                    //
                    // TAOTAO.init({
                    //     "pics" : data.image,
                    //     "cid" : data.cid,
                    //     fun:function(node){
                    //         TAOTAO.changeItemParam(node, "itemeEditForm");
                    //     }
                    // });
                }
            }).window("open");
        }
    },{
        text:'删除',
        iconCls:'icon-cancel',
        handler:function(){
            var ids = getSelectionsIds();
            if(ids.length == 0){
                $.messager.alert('提示','未选中项目!');
                return ;
            }
            $.messager.confirm('确认','确定删除ID为 '+ids+' 的项目吗？',function(r){
                if (r){
                    var params = {"id":ids};
                    $.post("/rest/item/delete",params, function(data){
                        if(data.status == 200){
                            $.messager.alert('提示','删除项目成功!',undefined,function(){
                                $("#itemList").datagrid("reload");
                            });
                        }
                    });
                }
            });
        }
    }];
</script>
