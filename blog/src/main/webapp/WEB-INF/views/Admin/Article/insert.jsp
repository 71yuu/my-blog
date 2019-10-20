<%--
  Created by IntelliJ IDEA.
  User: Yuu
  Date: 2019/1/7
  Time: 15:07
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="rapid" uri="http://www.rapid-framework.org.cn/rapid" %>
<link rel="stylesheet" href="/static/assets/plugin/editor/editormd.min.css"/>
<rapid:override name="title">
    - ${article.articleId == null ? "新增" : "编辑"}文章
</rapid:override>

<rapid:override name="content">
    <blockquote class="layui-elem-quote">
        <span class="layui-breadcrumb" lay-separator="/">
              <a href="/admin">首页</a>
              <a href="/admin/article">文章列表</a>
              <a><cite>${article.articleId == null ? "新增" : "编辑"}文章</cite></a>
        </span>
    </blockquote>


    <form class="layui-form" method="post" id="myForm" action="/admin/article/insertSubmit">
        <input type="hidden" name="articleId" value="${article.articleId}">
        <div class="layui-form-item">
            <label class="layui-form-label">标题 <span style="color: #FF5722; ">*</span></label>
            <div class="layui-input-block">
                <input type="text" name="articleTitle" lay-verify="title" id="title" value="${article.articleTitle}"
                       class="layui-input">
            </div>
        </div>

        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">内容 <span style="color: #FF5722; ">*</span></label>
            <div id="layout">
                <div id="article-editor">
                    <textarea style="display:none;" id="content" name="articleHtml">${article.articleHtml}</textarea>
                    <!-- html textarea 需要开启配置项 saveHTMLToTextarea == true -->
                    <textarea class="editormd-html-textarea" name="articleContent"></textarea>
                </div>
            </div>
        </div>


        <div class="layui-form-item">
            <label class="layui-form-label">分类 <span style="color: #FF5722; ">*</span></label>
            <div class="layui-input-inline">
                <select name="articleParentCategoryId" id="articleParentCategoryId"
                        lay-filter="articleParentCategoryId" lay-verify="required">
                    <option value="">一级分类</option>
                    <c:forEach items="${categoryList}" var="c">
                        <c:if test="${c.categoryPid == 0}">
                            <option value="${c.categoryId}"
                                    <c:if test="${article.categoryList[0].categoryId == c.categoryId}">
                                        selected
                                    </c:if>
                            >${c.categoryName}</option>
                        </c:if>
                    </c:forEach>
                </select>
            </div>
            <div class="layui-input-inline">
                <select name="articleChildCategoryId" id="articleChildCategoryId" lay-filter="articleChildCategoryId" lay-verify="required">
                    <c:forEach items="${categoryList}" var="c">
                        <c:if test="${c.categoryPid == article.categoryList[0].categoryId}">
                            <option value="${c.categoryId}"
                                    <c:if test="${article.categoryList[1].categoryId == c.categoryId}">selected</c:if>>${c.categoryName}</option>
                        </c:if>
                    </c:forEach>
                </select>
            </div>
        </div>
        <div class="layui-form-item" pane="">
            <label class="layui-form-label">标签</label>
            <div class="layui-input-block">
                <c:forEach items="${tagList}" var="t">
                    <input type="checkbox" name="articleTagIds" lay-skin="primary" title="${t.tagName}"
                           value="${t.tagId}"
                    <c:forEach items="${article.tagList}" var="t2">
                           <c:if test="${t.tagId == t2.tagId}">checked</c:if>
                    </c:forEach>>
                </c:forEach>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">状态</label>
            <div class="layui-input-block">
                <input type="radio" name="articleStatus" value="1" title="发布"
                       <c:if test="${article.articleStatus==1}">checked</c:if>>
                <input type="radio" name="articleStatus" value="0" title="草稿"
                       <c:if test="${article.articleStatus==0}">checked</c:if>>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit="" lay-filter="demo1">保存</button>
            </div>
        </div>
    </form>

</rapid:override>


<rapid:override name="footer-script">


    <script>
        layui.use(['form'], function() {
            // 获取各个模块
            var form = layui.form;

            //自定义验证规则
            form.verify({
                title: function (value) {
                    if (value.length < 5) {
                        return '标题至少得5个字符!';
                    }
                }
            });

            //二级联动
            form.on("select(articleParentCategoryId)",function () {
                var optionstring = "";
                var articleParentCategoryId = $("#articleParentCategoryId").val();
                <c:forEach items="${categoryList}" var="c">
                if(articleParentCategoryId == ${c.categoryPid}) {
                    optionstring += "<option name='childCategory' value='${c.categoryId}'>${c.categoryName}</option>";
                }
                </c:forEach>
                $("#articleChildCategoryId").html("<option value=''selected>二级分类</option>"+optionstring);
                form.render('select');
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


<%--此句必须放在最后--%>
<%@ include file="../Public/framework.jsp" %>


