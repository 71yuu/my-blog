<%--
  Created by IntelliJ IDEA.
  User: Yuu
  Date: 2019/1/9
  Time: 1:31
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="rapid" uri="http://www.rapid-framework.org.cn/rapid" %>

<rapid:override name="title">
    - ${link.linkId == null ? "新增" : "编辑"}链接
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
              <a href="/admin/link">链接列表</a>
              <a><cite>${link.linkId == null ? "新增" : "编辑"}链接</cite></a>
        </span>
    </blockquote>
    <div class="layui-row">
        <div class="layui-col-md4">
            <form class="layui-form" method="post" id="myForm" action="/admin/link/save">
                <div class="layui-form-item">
                    <div class="layui-input-block">
                        <strong>${link.linkId == null ? "新增" : "编辑"}链接</strong>
                    </div>
                    <input type="hidden" name="linkId" value="${link.linkId}">
                    <div class="layui-input-block">
                        名称 <span style="color: #FF5722; ">*</span>
                        <input type="text" name="linkName" value="${link.linkName}" lay-verify="linkName" autocomplete="off" class="layui-input">
                    </div>
                    <br>
                    <div class="layui-input-block">
                        URL  <span style="color: #FF5722; ">*</span>
                        <input type="text" name="linkUrl" value="${link.linkUrl}" lay-verify="linkUrl" autocomplete="off" class="layui-input">
                    </div>
                    <br>
                    <div class="layui-input-block">
                        描述
                        <input type="text" name="linkDescription" value="${link.linkDescription}" autocomplete="off" class="layui-input" >
                    </div>

                    <br>
                    <div class="layui-input-block">
                        Order
                        <input type="number" name="linkOrder" value="${link.linkOrder == null ? 1 : link.linkOrder}" autocomplete="off" class="layui-input" min="1" max="10">
                    </div>
                    <br>
                    <div class="layui-input-block">
                        状态 <br>
                        <input type="radio" name="linkStatus" value="1" title="显示" <c:if test="${link.linkStatus==1 || link.linkStatus == null}">checked</c:if>>
                        <input type="radio" name="linkStatus" value="0" title="隐藏" <c:if test="${link.linkStatus==0}">checked</c:if>>
                    </div>
                    <br>
                    <div class="layui-input-block">
                        <button class="layui-btn" lay-filter="formDemo" lay-submit="" type="submit">保存</button>
                    </div>
                </div>
            </form>
        </div>
        <div class="layui-col-md8">
            <table class="layui-table" >
                <colgroup>
                    <col width="50">
                    <col width="300">
                    <col width="100">
                    <col width="50">
                    <col width="100">
                </colgroup>
                <thead>
                <tr>
                    <th>id</th>
                    <th>名称</th>
                    <th>URL</th>
                    <th>Order</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${linkList}" var="l">

                    <tr>
                        <td>${l.linkId}</td>
                        <td>
                                ${l.linkName}
                        </td>
                        <td>
                                ${l.linkUrl}
                        </td>
                        <td>
                                ${l.linkOrder}
                        </td>
                        <td>
                            <a href="/admin/link/edit/${l.linkId}" class="layui-btn layui-btn-mini">编辑</a>
                            <a href="javascript:;" class="layui-btn layui-btn-danger layui-btn-mini" onclick="confirmDelete('/admin/link/delete/', ${link.linkId}, '/admin/link')">删除</a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>

        </div>
    </div>

</rapid:override>
<rapid:override name="footer-script">
    <script>
        layui.use(['form'],function () {
            var form = layui.form;

            // 自定义验证规则
            form.verify({
                linkName:function (value) {
                    if (value.length == 0) {
                        return '链接名称不能为空';
                    }
                },
                linkUrl:function (value) {
                    if (value.length == 0) {
                        return '链接地址不能为空';
                    }
                }
            })
        });
    </script>
</rapid:override>

<%@ include file="../Public/framework.jsp"%>
