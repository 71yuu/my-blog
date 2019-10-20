<%--
  Created by IntelliJ IDEA.
  User: Yuu
  Date: 2019/1/8
  Time: 16:21
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="rapid" uri="http://www.rapid-framework.org.cn/rapid" %>

<rapid:override name="title">
    - ${tag.tagId == null ? "新增" : "编辑"}标签
</rapid:override>
<rapid:override name="header-style">
    <style>
        /*覆盖 layui*/
        .layui-input-block {
            margin:0px 10px;
        }
        .layui-table {
            margin-top: 0;
        }
        .layui-col-md4 {
            padding:10px;
        }
        .layui-col-md8 {
            padding:10px;
        }
        .layui-btn {
            margin: 2px 0!important;
        }
    </style>
</rapid:override>

<rapid:override name="content">

    <blockquote class="layui-elem-quote">
        <span class="layui-breadcrumb" lay-separator="/">
              <a href="/admin">首页</a>
              <a href="/admin/tag">标签列表</a>
              <a><cite>${tag.tagId == null ? "新增" : "编辑"}标签</cite></a>
        </span>
    </blockquote>
    <div class="layui-row">
        <div class="layui-col-md4" >
            <form class="layui-form" method="post" id="myForm" action="/admin/tag/save">
                <div class="layui-form-item">
                    <div class="layui-input-block">
                        <strong>编辑标签</strong>
                    </div>
                    <input type="hidden" name="tagId" value="${tag.tagId}">
                    <div class="layui-input-block">
                        名称 <span style="color: #FF5722; ">*</span>
                        <input type="text" name="tagName" value="${tag.tagName}" autocomplete="off" class="layui-input" lay-verify="tagName">
                    </div>
                    <br>
                    <div class="layui-input-block">
                        标签描述
                        <input type="text" name="tagDescription" value="${tag.tagDescription}" autocomplete="off" class="layui-input" >
                    </div>
                    <br>
                    <div class="layui-input-block">
                        <button class="layui-btn" lay-submit="" lay-filter="formDemo" type="submit">保存</button>
                    </div>
                </div>
            </form>
        </div>
        <div class="layui-col-md8">
            <table class="layui-table" >
                <colgroup>
                    <col width="300">
                    <col width="50">
                    <col width="100">
                    <col width="50">
                </colgroup>
                <thead>
                <tr>
                    <th>名称</th>
                    <th>文章数</th>
                    <th>操作</th>
                    <th>id</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${tagList}" var="c">

                    <tr>
                        <td>
                            <a href="/tag/${c.tagId}" target="_blank">${c.tagName}</a>
                        </td>
                        <td>
                            <a href="/tag/${c.tagId}" target="_blank">${c.articleCount}</a>
                        </td>
                        <td>
                            <a href="/admin/tag/edit/${c.tagId}" class="layui-btn layui-btn-mini">编辑</a>
                            <c:if test="${c.articleCount==0}">
                                <a href="javascript:;" class="layui-btn layui-btn-danger layui-btn-mini" onclick="confirmDelete('/admin/tag/delete/', ${c.tagId}, '/admin/tag')">删除</a>
                            </c:if>
                        </td>
                        <td>${c.tagId}</td>
                    </tr>

                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>

</rapid:override>
<rapid:override name="footer-script">
    <script>
        layui.use('form', function () {
            var form = layui.form;

            // 自定义验证规则
            form.verify({
                tagName:function (value) {
                    if (value.length == 0) {
                        return '标签名称都没写，你就想保存?'
                    }
                }
            })
        })
    </script>
</rapid:override>

<%@ include file="../Public/framework.jsp"%>
