<%--
  Created by IntelliJ IDEA.
  User: Yuu
  Date: 2019/1/8
  Time: 20:35
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="rapid" uri="http://www.rapid-framework.org.cn/rapid" %>
<link rel="stylesheet" href="/static/assets/plugin/editor/editormd.min.css"/>
<rapid:override name="title">
    - ${page.pageId == null ? "新增" : "编辑"}页面
</rapid:override>

<rapid:override name="content">
    <blockquote class="layui-elem-quote">
        <span class="layui-breadcrumb" lay-separator="/">
              <a href="/admin">首页</a>
              <a href="/admin/page">页面列表</a>
              <a><cite>${page.pageId == null ? "新增" : "编辑"}页面</cite></a>
        </span>
    </blockquote>


    <form class="layui-form" method="post" id="myForm"
          action="/admin/page/save">
        <input type="hidden" name="pageId" value="${page.pageId}">
        <div class="layui-form-item">
            <label class="layui-form-label">别名<span style="color: #FF5722; ">*</span></label>
            <div class="layui-input-inline">
                <input type="text" name="pageKey" lay-verify="key" id="key" value="${page.pageKey}"
                       class="layui-input">
            </div>
            <div class="layui-form-mid layui-word-aux">请填写2到20位，仅允许字母、下划线和减号组成</div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">标题 <span style="color: #FF5722; ">*</span></label>
            <div class="layui-input-inline">
                <input type="text" name="pageTitle" lay-verify="title" id="title" value="${page.pageTitle}"
                       class="layui-input">
            </div>
        </div>

        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">内容 <span style="color: #FF5722; ">*</span></label>
            <div class="layui-input-block">
                <div id="page-editor">
                    <textarea style="display:none;" id="content" name="pageHtml">${page.pageHtml}</textarea>
                    <!-- html textarea 需要开启配置项 saveHTMLToTextarea == true -->
                    <textarea class="editormd-html-textarea" name="pageContent">${page.pageContent}</textarea>
                </div>
            </div>
        </div>


        <div class="layui-form-item">
            <label class="layui-form-label">状态</label>
            <div class="layui-input-block">
                <input type="radio" name="pageStatus" value="1" title="显示"
                       <c:if test="${page.pageStatus==1}">checked</c:if>>
                <input type="radio" name="pageStatus" value="0" title="隐藏"
                       <c:if test="${page.pageStatus==0}">checked</c:if>>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn layui-btn-normal" onclick="back()">返回</button>
                <button class="layui-btn" lay-submit="">保存</button>
            </div>
        </div>
    </form>

    <input type="hidden" id="errMsg" value="${errMsg}" />

</rapid:override>


<rapid:override name="footer-script">

    <script>
        layui.use(['form'],function () {
            var form = layui.form;


            // 自定义验证规则
            form.verify({
                key:[/^[a-zA-Z_-]{2,20}$/, '别名输入不规范'],
                title:function (value) {
                    if (value.length == 0) {
                        return '请输入标题！'
                    }
                }
            })
        });
    </script>


    <script src="/static/assets/plugin/editor/editormd.min.js"></script>
    <script type="text/javascript">
        $(function() {
            var testEditor = editormd("page-editor", {
                width: "100%",
                height: 640,
                markdown : "",
                path : '/static/assets/plugin/editor/lib/',
                saveHTMLToTextarea : true,
                imageUpload : true,
                imageFormats : ["jpg", "jpeg", "gif", "png", "bmp", "webp"],
                imageUploadURL : "/uploadFile"
            });
        });
    </script>

    <script>
        $(function () {
            var errMsg = $("#errMsg").val();
            if (errMsg != null && errMsg.length > 0) {
                layer.alert(errMsg, {icon:2});
            }
        })
    </script>

</rapid:override>


<%--此句必须放在最后--%>
<%@ include file="../Public/framework.jsp" %>

