<%--
  Created by IntelliJ IDEA.
  User: Yuu
  Date: 2019/1/8
  Time: 0:30
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="rapid" uri="http://www.rapid-framework.org.cn/rapid" %>

<rapid:override name="title">
    - 分类列表
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
              <a href="/admin/category">分类列表</a>
              <a><cite>${category.categoryId == null ? "添加" : "编辑"}分类</cite></a>
        </span>
    </blockquote>
    <div class="layui-row">
        <div class="layui-col-md4">
            <form class="layui-form"  method="post" id="myForm" action="/admin/category/insertSubmit">
                <div class="layui-form-item">
                    <input type="hidden" value="${category.categoryId}" name="categoryId"/>
                    <div class="layui-input-block">
                        <strong>${category.categoryId == null ? "添加" : "编辑"}分类</strong>
                    </div>
                    <div class="layui-input-block">
                        分类名称 <span style="color: #FF5722; ">*</span>
                        <input type="text" name="categoryName" placeholder="请输入分类名称" value="${category.categoryName}" lay-verify="categoryName" autocomplete="off" class="layui-input">
                    </div>
                    <br>
                    <div class="layui-input-block">
                        父节点 <span style="color: #FF5722; ">*</span>
                        <select name="categoryPid" class="layui-input">
                            <option value="0" <c:if test="${category.categoryPid==0}">selected</c:if> >无</option>
                            <c:forEach items="${categoryList}" var="c">
                                <c:choose>
                                    <c:when test="${c.categoryId==category.categoryPid}">
                                        <option value="${c.categoryId}" selected>${c.categoryName}</option>
                                    </c:when>
                                    <c:otherwise>
                                        <c:if test="${category.categoryPid != 0}">
                                            <c:if test="${c.categoryPid==0}">
                                                <option value="${c.categoryId}">${c.categoryName}</option>
                                            </c:if>
                                        </c:if>
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>
                        </select>
                    </div>
                    <br>
                    <div class="layui-input-block">
                        分类描述
                        <input type="text" name="categoryDescription" value="${category.categoryDescription}" placeholder="请输入分类描述" autocomplete="off" class="layui-input" >
                    </div>
                    <br>
                    <div class="layui-input-block">
                        图标样式
                        <input style="margin-bottom: 10px;" type="text" name="categoryIcon" value="${category.categoryIcon}" placeholder="请输入图标样式,如 fa fa-coffee" autocomplete="off" class="layui-input" >
                        <a target="_blank" href="https://www.thinkcmf.com/font/font_awesome/icons.html" aria-label="参考图标">参考图标</a>
                    </div>
                    <div class="layui-input-block" style="margin-top: 25px;">
                        分类排序
                        <input type="hidden" id="categoryOrder" value="${category.categoryOrder == null ? "0" : category.categoryOrder}" name="categoryOrder"/>
                        <div id="orderSlider" class="demo-slider" style="margin-top: 10px;"></div>
                    </div>
                    <br>
                    <div class="layui-input-block">
                        <button class="layui-btn" lay-submit="" >保存</button>
                    </div>
                </div>
            </form>
        </div>
        <div class="layui-col-md8" >
            <table class="layui-table" >
                <colgroup>
                    <col width="300">
                    <col width="100">
                    <col width="100">
                    <col width="100">
                    <col width="50">
                    <col width="50">
                </colgroup>
                <thead>
                <tr>
                    <th>名称</th>
                    <th>文章数</th>
                    <th>操作</th>
                    <th>ID</th>
                    <th>pid</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${categoryList}" var="c">
                    <c:if test="${c.categoryPid==0}">
                        <tr>
                            <td>
                                <a href="/category/${c.categoryId}" target="_blank">${c.categoryName}</a>
                            </td>
                            <td>
                                <a href="/category/${c.categoryId}" target="_blank">${c.articleCount}</a>
                            </td>
                            <td>
                                <a href="/admin/category/edit/${c.categoryId}" class="layui-btn layui-btn-mini">编辑</a>
                                <c:if test="${c.articleCount==0}">
                                    <a href="javascript:;" class="layui-btn layui-btn-danger layui-btn-mini" onclick="confirmDelete('/admin/category/delete/', ${c.categoryId}, '/admin/category')">删除</a>
                                </c:if>
                            </td>
                            <td>${c.categoryId}</td>
                            <td>${c.categoryPid}</td>
                        </tr>
                        <c:forEach items="${categoryList}" var="c2">
                            <c:if test="${c2.categoryPid==c.categoryId}">
                                <tr>
                                    <td>
                                        <a href="/category/${c2.categoryId}" target="_blank">——${c2.categoryName}</a>
                                    </td>
                                    <td>
                                        <a href="/category/${c2.categoryId}" target="_blank">${c2.articleCount}</a>
                                    </td>
                                    <td>
                                        <a href="/admin/category/edit/${c2.categoryId}" class="layui-btn layui-btn-mini">编辑</a>
                                        <c:if test="${c2.articleCount==0}">
                                            <a href="javascript:;" class="layui-btn layui-btn-danger layui-btn-mini" onclick="confirmDelete('/admin/category/delete/', ${c2.categoryId}, '/admin/category')">删除</a>
                                        </c:if>
                                    </td>
                                    <td class="cate-parent">${c2.categoryId}</td>
                                    <td>${c2.categoryPid}</td>
                                </tr>
                            </c:if>
                        </c:forEach>
                    </c:if>


                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>






</rapid:override>
<rapid:override name="footer-script">
    <script>
        layui.use(['form','slider'],function () {
            var form = layui.form,
            slider = layui.slider;

            var ins = slider.render({
               elem:"#orderSlider",
               input:true,
                max:10,
                min:1,
                change:function (value) {
                    $("#categoryOrder").val(value);
                }
            });

            ins.setValue($("#categoryOrder").val());

            // 自定义验证规则
            form.verify({
                categoryName:function (value) {
                    if (value.length == 0) {
                        return '你飘了，名称都不写，你就想添加了?';
                    }
                },
                categoryDescription:function (value) {
                    if (value.length == 0) {
                        return '不描述一下，我咋知道这分类啥意思！'
                    }
                }
            })
        });
    </script>
</rapid:override>

<%@ include file="../Public/framework.jsp"%>
