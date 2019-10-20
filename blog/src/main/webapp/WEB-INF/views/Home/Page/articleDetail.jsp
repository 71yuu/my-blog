<%--
  Created by IntelliJ IDEA.
  User: Yuu
  Date: 2019/1/11
  Time: 0:04
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="rapid" uri="http://www.rapid-framework.org.cn/rapid" %>

<rapid:override name="title">
    <title>${article.articleTitle}</title>
</rapid:override>

<rapid:override name="header-style">
    <rapid:override name="header-style">
        <link rel="stylesheet" href="/css/highlight.css">
        <style>
            .entry-title {
                background: #f8f8f8;
            }
        </style>
    </rapid:override>
</rapid:override>

<rapid:override name="breadcrumb">
    <%--面包屑导航 start--%>
    <nav class="breadcrumb">
        <a class="crumbs" href="/">
            <i class="fa fa-home"></i>首页
        </a>
        <c:choose>
            <c:when test="${article.categoryList != null && article.categoryList.size() > 0}">
                <c:forEach items="${article.categoryList}" var="c">
                    <i class="fa fa-angle-right"></i>
                    <a href="/category/${c.categoryId}">
                            ${c.categoryName}
                    </a>
                </c:forEach>
            </c:when>
            <c:otherwise>
                <i class="fa fa-angle-right"></i>
                <a>未分类</a>
            </c:otherwise>
        </c:choose>
        <i class="fa fa-angle-right"></i>
        正文
    </nav>
    <%--面包屑导航 end--%>
</rapid:override>


<rapid:override name="left">
    <%--博客主体-左侧文章正文 start--%>
    <div id="primary" class="content-area">
        <main id="main" class="site-main" role="main">
            <article class="post" id="articleDetail" data-id="${article.articleId}">
                <header class="entry-header">
                    <h1 class="entry-title">
                            ${article.articleTitle}
                    </h1>
                </header><!-- .entry-header -->
                <div class="entry-content">
                    <div class="single-content">
                            ${article.articleContent}
                    </div>
                    <div class="clear"></div>
                    <div id="social">
                        <div class="social-main">
                            <span class="like">
                                <a href="javascript:;" data-action="ding" data-id="1" title="点赞"
                                   class="favorite" onclick="increaseLikeCount()">
                                    <i class="fa fa-thumbs-up"></i>赞
                                    <i class="count"
                                       id="count-${article.articleId}">${article.articleLikeCount}</i>
                                </a>
                            </span>
                            <div class="shang-p">
                                <div class="shang-empty"><span></span></div>
                                <span class="shang-s">
                                    <a onclick="PaymentUtils.show();" style="cursor:pointer">赏</a>
                                </span>
                            </div>
                            <div class="share-sd">
                                        <span class="share-s" style="margin-top: 25px!important;">
                                            <a href="javascript:void(0)" id="share-s" title="分享">
                                                <i class="fa fa-share-alt"></i>分享
                                            </a>
                                        </span>
                                <div id="share">
                                    <ul class="bdsharebuttonbox bdshare-button-style1-16" data-bd-bind="1503997585792">
                                        <li><a title="更多" class="bds_more fa fa-plus-square" data-cmd="more"
                                               onclick="return false;" href="#"></a></li>
                                        <li><a title="分享到QQ空间" class="fa fa-qq" data-cmd="qzone" onclick="return false;"
                                               href="#"></a></li>
                                        <li><a title="分享到新浪微博" class="fa fa-weibo" data-cmd="tsina"
                                               onclick="return false;" href="#"></a></li>
                                        <li><a title="分享到微信" class="fa fa-weixin" data-cmd="weixin"
                                               onclick="return false;" href="#"></a></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="clear"></div>
                        </div>
                    </div>

                    <footer class="single-footer">
                        <ul class="single-meta">
                            <c:if test="${sessionScope.user!=null}">
                                <li class="edit-link">
                                    <a target="_blank" class="post-edit-link"
                                       href="/admin/article/edit/${article.articleId}">编辑</a>
                                </li>
                            </c:if>
                            <li class="comment">
                                <a href="/article/${article.articleId}#comments"
                                   rel="external nofollow">
                                    <i class="fa fa-comment-o"></i>
                                    <i class="comment-count">${commentList.size()}</i>
                                </a>
                            </li>
                            <li class="views">
                                <i class="fa fa-eye"></i> <span
                                    class="articleViewCount">${article.articleViewCount}</span>
                                views
                            </li>
                            <li class="r-hide">
                                <a href="javascript:pr()" title="侧边栏">
                                    <i class="fa fa-caret-left"></i>
                                    <i class="fa fa-caret-right"></i>
                                </a>
                            </li>
                        </ul>
                        <ul id="fontsize">
                            <li>A+</li>
                        </ul>
                        <div class="single-cat-tag">
                            <div class="single-cat">所属分类：
                                <c:forEach items="${article.categoryList}" var="c">
                                    <a href="/category/${c.categoryId}">
                                            ${c.categoryName}
                                    </a>
                                </c:forEach>
                            </div>
                        </div>
                    </footer><!-- .entry-footer -->


                    <div class="clear"></div>
                </div><!-- .entry-content -->
            </article><!-- #post -->

                <%--所属标签 start--%>
            <div class="single-tag">
                <ul class="" data-wow-delay="0.3s">
                    <c:forEach items="${article.tagList}" var="t">
                        <li>
                            <a href="/tag/${t.tagId}" rel="tag"
                               style="background:#666666">
                                    ${t.tagName}
                            </a>
                        </li>
                    </c:forEach>
                </ul>
            </div>
                <%--所属标签 end--%>


                <%--版权声明 start--%>
            <div class="authorbio wow fadeInUp">
                <img alt="${article.user.userNickname}" src="${article.user.userAvatar}"
                     class="avatar avatar-64 photo" height="64" width="64">
                <ul class="postinfo">
                    <li></li>
                    <li><strong>版权声明：</strong>本站原创文章，于<fmt:formatDate
                            value="${article.articleCreateTime}"
                            pattern="yyyy-MM-dd"/>，由
                        <strong>
                                ${article.user.userNickname}
                        </strong>
                        发表。
                    </li>
                    <li class="reprinted"><strong>转载请注明：</strong>
                        <a href="/article/${article.articleId}"
                           rel="bookmark"
                           title="本文固定链接 /article/${article.articleId}">
                                ${article.articleTitle} | ${options.optionSiteTitle}</a>
                    </li>
                </ul>
                <div class="clear"></div>
            </div>
                <%--版权声明 end--%>

                <%--相关文章 start--%>
            <div id="single-widget">
                <div class="wow fadeInUp" data-wow-delay="0.3s">
                    <aside id="related_post-2" class="widget">
                        <h3 class="widget-title">
                            <span class="s-icon"></span>相关文章
                        </h3>
                        <div id="related_post_widget">
                            <ul>
                                <c:forEach items="${similarArticleList}" var="s">
                                    <li>
                                        <a href="/article/${s.articleId}">${s.articleTitle}</a>
                                    </li>
                                </c:forEach>
                            </ul>
                        </div>
                        <div class="clear"></div>
                    </aside>
                        <%--猜你喜欢 start--%>
                    <aside id="hot_post-8" class="widget hot_post">
                        <h3 class="widget-title"><span class="s-icon"></span>猜你喜欢</h3>
                        <div id="hot_post_widget">
                            <ul>
                                <c:forEach items="${mostViewArticleList}" var="m">
                                    <li>
                                        <a href="/article/${m.articleId}">
                                                ${m.articleTitle}
                                        </a>
                                    </li>
                                </c:forEach>
                            </ul>
                        </div>
                        <div class="clear"></div>
                    </aside>
                        <%--猜你喜欢 end--%>
                </div>
                <div class="clear"></div>
            </div>
                <%--相关文章 end--%>

                <%--上一篇下一篇 start--%>
            <nav class="nav-single">
                <c:choose>
                    <c:when test="${preArticle!=null}">
                        <a href="/article/${preArticle.articleId}" rel="next">
                            <span class="meta-nav">
                                <span class="post-nav">上一篇
                                 <i class="fa fa-angle-left"></i>
                                </span>
                                <br>${preArticle.articleTitle}
                            </span>
                        </a>
                    </c:when>
                    <c:otherwise>
                              <span class="meta-nav">
                                    <span class="post-nav">
                                        没有了<br>
                                    </span>已是第一篇文章
                                </span>
                    </c:otherwise>
                </c:choose>
                <c:choose>
                    <c:when test="${afterArticle!=null}">
                        <a href="/article/${afterArticle.articleId}" rel="next">
                            <span class="meta-nav">
                                <span class="post-nav">下一篇
                                 <i class="fa fa-angle-right"></i>
                                </span>
                                <br>${afterArticle.articleTitle}
                            </span>
                        </a>
                    </c:when>
                    <c:otherwise>
                            <span class="meta-nav">
                                <span class="post-nav">
                                    没有了<br>
                                </span>已是最后文章
                             </span>
                    </c:otherwise>
                </c:choose>

                <div class="clear"></div>
            </nav>
                <%--上一篇下一篇 end--%>
        </main>
        <!-- .site-main -->
    </div>
    <%--博客主体-左侧文章正文end--%>
</rapid:override>


<%--侧边栏 start--%>
<rapid:override name="right">
    <%@include file="../Public/part/sidebar-1.jsp" %>
</rapid:override>
<%--侧边栏 end--%>

<rapid:override name="footer-script">
    <script src="/static/assets/js/jquery.cookie.js"></script>

    <script type="text/javascript">
        var articleId = $("#articleDetail").attr("data-id");
        increaseViewCount(articleId);
        layui.code({
            elem: 'pre',//默认值为.layui-code
            // skin: 'notepad', //如果要默认风格，不用设定该key。
            about: false
        });
    </script>

</rapid:override>


<%@ include file="../Public/framework.jsp" %>