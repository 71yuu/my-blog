<%--
  Created by IntelliJ IDEA.
  User: Yuu
  Date: 2019/1/9
  Time: 17:26
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="rapid" uri="http://www.rapid-framework.org.cn/rapid" %>
<link rel="stylesheet" href="/static/assets/plugin/editor/editormd.min.css"/>

<rapid:override name="title">
    - ${notice.noticeId == null ? "新增" : "编辑"}公告
</rapid:override>
<rapid:override name="header-style">
    <style>

    </style>
</rapid:override>

<rapid:override name="content">

    <blockquote class="layui-elem-quote">
        <span class="layui-breadcrumb" lay-separator="/">
              <a href="/admin">首页</a>
              <a href="/admin/notice">公告列表</a>
              <a><cite>${notice.noticeId == null ? "新增" : "编辑"}公告</cite></a>
        </span>
    </blockquote>

    <form class="layui-form"  method="post" id="myForm" action="/admin/notice/save">
        <input type="hidden" name="noticeId" value="${notice.noticeId}">
        <div class="layui-form-item">
            <label class="layui-form-label">标题  <span style="color: #FF5722; ">*</span></label>
            <div class="layui-input-block">
                <input type="text" name="noticeTitle" lay-verify="title" id="title" value="${notice.noticeTitle}" class="layui-input" required>
            </div>
        </div>

        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">内容  <span style="color: #FF5722; ">*</span></label>
            <div id="article-editor">
                <textarea style="display:none;" id="content" name="noticeHtml">${notice.noticeHtml}</textarea>
                <!-- html textarea 需要开启配置项 saveHTMLToTextarea == true -->
                <textarea class="editormd-html-textarea" name="noticeContent">${notice.noticeContent}</textarea>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">Order </label>
            <div class="layui-input-inline">
                <input type="number" name="noticeOrder" value="${notice.noticeOrder}"class="layui-input" min="0" max="10" >
            </div>
            <div class="layui-form-mid layui-word-aux">输入1-10的数字,order越大排序越前</div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">状态</label>
            <div class="layui-input-block">
                <input type="radio" name="noticeStatus" value="1" title="显示" <c:if test="${notice.noticeStatus==1 || notice.noticeStatus == null}">checked</c:if>>
                <input type="radio" name="noticeStatus" value="0" title="隐藏" <c:if test="${notice.noticeStatus==0}">checked</c:if>>
            </div>

        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit="" lay-filter="" type="submit">保存</button>
            </div>
        </div>
    </form>


</rapid:override>
<rapid:override name="footer-script">
    <script>
        layui.use('from', function () {
            var from = layui.from;

            // 自定义校验规则
            from.verify({
                title:function (value) {
                    if (value.length == 0) {
                        return '公告标题不能为空';
                    }
                }
            })
        });
    </script>

    <script src="/static/assets/plugin/editor/editormd.min.js"></script>
    <script type="text/javascript">
        $(function() {
            var testEditor = editormd("article-editor", {
                width: "93%",
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
</rapid:override>

<%@ include file="../Public/framework.jsp"%>
