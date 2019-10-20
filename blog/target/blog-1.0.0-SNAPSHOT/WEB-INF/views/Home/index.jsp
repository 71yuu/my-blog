<%--
  Created by IntelliJ IDEA.
  User: Yuu
  Date: 2019/1/10
  Time: 8:26
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="/WEB-INF/myTag.tld" prefix="yuu" %>
<%@ taglib prefix="rapid" uri="http://www.rapid-framework.org.cn/rapid" %>

<!-- 公告 -->
<rapid:override name="breadcrumb">
    <nav class="breadcrumb">
        <div class="bull"><i class="fa fa-volume-up"></i></div>
        <div id="scrolldiv">
            <div class="scrolltext">
                <ul style="margin-top: 0px;">
                    <c:forEach items="${noticeList}" var="n">
                        <li class="scrolltext-title">
                            <a href="/notice/${n.noticeId}" rel="bookmark">${n.noticeTitle}</a>
                        </li>
                    </c:forEach>
                </ul>
            </div>
        </div>
    </nav>
</rapid:override>


<rapid:override name="left">
    <div id="primary" class="content-area">

        <main id="main" class="site-main" role="main">
            <c:forEach items="${pageInfo.list}" var="a">

                <article class="post type-post">

                    <figure class="thumbnail">
                        <a href="/article/${a.articleId}">
                            <img width="280" height="210"
                                 src="/static/assets/img/thumbnail/random/img_${a.articleId%15}.jpg"
                                 class="attachment-content size-content wp-post-image"
                                 alt="${a.articleTitle}">
                        </a>
                        <span class="cat">
                                <a href="/category/${a.categoryList[a.categoryList.size()-1].categoryId}">
                                        ${a.categoryList[a.categoryList.size()-1].categoryName}
                                </a>
                            </span>
                    </figure>

                    <header class="entry-header">
                        <h2 class="entry-title">
                            <a href="/article/${a.articleId}"
                               rel="bookmark">
                                    ${a.articleTitle}
                            </a>
                        </h2>
                    </header>

                    <div class="entry-content">
                        <div class="archive-content" id="articleContent">
                            <a href="/article/${a.articleId}"> <yuu:htmlFilter>${a.articleContent}</yuu:htmlFilter>...</a>
                        </div>
                        <span class="title-l"></span>
                        <span class="new-icon">
                            <c:choose>
                                <c:when test="${a.articleStatus == 2}">
                                    <i class="fa fa-bookmark-o"></i>
                                </c:when>
                                <c:otherwise>
                                    <jsp:useBean id="nowDate" class="java.util.Date"/>
                                    <c:set var="interval"
                                           value="${nowDate.time - a.articleCreateTime.time}"/><%--时间差毫秒数--%>
                                    <fmt:formatNumber value="${interval/1000/60/60/24}" pattern="#0"
                                                      var="days"/>
                                    <c:if test="${days <= 7}">NEW</c:if>
                                </c:otherwise>
                            </c:choose>
                        </span>
                        <span class="entry-meta">
                            <span class="date">
                                <fmt:formatDate value="${a.articleCreateTime}" pattern="yyyy年MM月dd日"/>
                            &nbsp;&nbsp;
                            </span>
                            <span class="views">
                                <i class="fa fa-eye"></i>
                                    ${a.articleViewCount} views
                            </span>
                        </span>
                        <div class="clear"></div>
                    </div><!-- .entry-content -->

                    <span class="entry-more">
                        <a href="/article/${a.articleId}"
                           rel="bookmark">
                            阅读全文
                        </a>
                    </span>
                </article>
            </c:forEach>
        </main>
        <%@ include file="Public/part/paging.jsp" %>

    </div>
</rapid:override>
<%--左侧区域 end--%>

<%--侧边栏 start--%>
<rapid:override name="right">
    <%@include file="Public/part/sidebar-2.jsp" %>
</rapid:override>
<%--侧边栏 end--%>

<%@ include file="Public/framework.jsp" %>