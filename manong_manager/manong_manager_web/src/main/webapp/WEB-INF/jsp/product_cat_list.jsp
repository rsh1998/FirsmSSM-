<%--
  Created by IntelliJ IDEA.
  User: 86184
  Date: 2021/4/9
  Time: 0:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>商品分类</title>
</head>
<body>
<ul id="productCategory" class="easyui-tree"></ul>
<div id="mm" class="easyui-menu" style="width:120px;">
    <div onclick="append()" data-options="iconCls:'icon-add'">添加</div>
    <div onclick="edit()" data-options="iconCls:'icon-edit'">修改</div>
    <div onclick="remove()" data-options="iconCls:'icon-remove'">删除</div>
</div>
<script type="text/javascript">
    $(function () {
        $('#productCategory').tree({
            url: "/product_category/list",
            onContextMenu: function(e, node){
                e.preventDefault();
                // select the node
                $('#productCategory').tree('select', node.target);
                // display context menu
                $('#mm').menu('show', {
                    left: e.pageX,
                    top: e.pageY
                });
            },
            onAfterEdit: function (node) {
                var _tree = $('#productCategory');
                if(node.id==0){
                    $.post("/product_category/add",{parentId:node.parentId,name:node.text},function (data) {
                        if(data.status==200){
                            _tree.tree('update', {
                                target: node.target,
                                id: data.msg,
                                parentId:node.parentId,
                            });
                        }else{
                            $.messager.alert("添加分类失败");
                        }
                    })
                }else{
                    //修改分类信息
                }
            }
        });
    });
    function append() {
        var tree =  $('#productCategory');
        var node = tree.tree('getSelected');
        tree.tree('append',{
            parent: (node?node.target:null),
            data: [{
                id : 0,
                parentId : node.id,
                text:'新建分类'
            }]
        });

        var node_ = tree.tree("find",0);
        tree.tree('beginEdit',node_.target)
    }
    function edit() {
        var node = $('#productCategory').tree('getSelected');
        $('#productCategory').tree('beginEdit',node.target);
    }
    function  remove() {
        var node = $('#productCategory').tree('getSelected');
        $.post("/product_category/del",{parentId:node.attributes,id:node.id},function(data){
            if(data.status==200){
                $('#productCategory').tree('remove',node.target);
            }else{
                $.messager.alert("删除分类失败");
            }
        })
    }
</script>
</body>

</html>
