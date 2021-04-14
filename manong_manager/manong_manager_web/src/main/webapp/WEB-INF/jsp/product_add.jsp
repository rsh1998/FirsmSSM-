<%@ page import="com.manong.pojo.EasyUITree" %>
<%@ page import="java.util.List" %>
<%--
  Created by IntelliJ IDEA.
  User: 86184
  Date: 2021/4/11
  Time: 14:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>商品添加</title>
</head>
<body>
<script type="text/javascript" charset="utf-8" src="ueditor/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="ueditor/ueditor.all.min.js"> </script>
<!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
<!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
<script type="text/javascript" charset="utf-8" src="ueditor/lang/zh-cn/zh-cn.js"></script>
<script type="text/javascript" charset="utf-8" src="/js/product_add.js"></script>
<%
    List<EasyUITree> list = (List) session.getAttribute("categories");
%>
<div style="padding: 10px 10px 10px 10px;">
    <form id="productAddForm" method="post">
        <input type="hidden" name="categoryId">
        <input type="hidden" name="image">
        <input type="hidden" name="description">
        <table cellpadding="10px">
            <tr>
                <td>商品名称</td>
                <td><input class="easyui-textbox" name="name" data-options="required:true" style="width:1200px;"></td>
            </tr>
            <tr>
                <td>商品分类</td>
                <td>
                    <select id="cc" class="easyui-combobox" name="cid" style="width:200px;">
                        <option value="0">请选择</option>
                        <%
                            for(int i=0;i<list.size();i++){
                                EasyUITree item = list.get(i);
                        %>
                        <option value="<%=item.getId()%>"><%=item.getText()%></option>
                        <%
                            }
                        %>
                    </select>
                    <p id="cbox" style="display: none"></p>
                </td>
            </tr>
            <tr>
                <td>商品价格</td>
                <td>
                    <input class="easyui-numberbox" name="pricePreview" data-options="min:1,max:99999999,required:true,precision:2" style="width:1200px;">
                    <input type="hidden" name="price">
                </td>
            </tr>
            <tr>
                <td>市场价格</td>
                <td>
                    <input class="easyui-numberbox" name="marketPricePreview" data-options="min:1,max:99999999,required:true,precision:2" style="width:1200px;">
                    <input type="hidden" name="marketPrice">
                </td>
            </tr>
            <tr>
                <td>商品编号</td>
                <td>
                    <input class="easyui-numberbox" name="productNumber" data-options="required:true" style="width:1200px;">
                </td>
            </tr>
            <tr>
                <td>商品主图</td>
                <td>
                    <input id="fileName" name="uploadfile"/>
                    <a  href="#" class="easyui-linkbutton uploadPic">上传图片</a>
                </td>
            </tr>
            <tr>
                <td>主图预览</td>
                <td>
                    <img src="" id="img" width="400" height="220">
                </td>
            </tr>
            <tr>
                <td>商品描述</td>
                <td>
                    <script id="editor" type="text/plain" style="width:1200px;height:500px;"></script>
                </td>
            </tr>
        </table>
    </form>
    <div align="center">
        <a id="btn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-ok'" onclick="submitForm()">提交</a>
        <a id="btn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'">重置</a>
    </div>
</div>
<script>
    $(function () {
        MANONG.init();
    });
    function submitForm() {
        $("#productAddForm").find("input[name='description']").val(UE.getEditor('editor').getContent());
        $("#productAddForm").find("input[name='price']").val(eval($("#productAddForm").find("input[name='pricePreview']").val()*100));
        $("#productAddForm").find("input[name='marketPrice']").val(eval($("#productAddForm").find("input[name='marketPricePreview']").val()*100));
        $.post("/product_save",$("#productAddForm").serialize(),function (data) {
            if(data.status == 200){
                $.messager.alert('提示','成功添加商品');
            }
        })
    }


</script>
</body>
</html>
