<%--
  Created by IntelliJ IDEA.
  User: Yuu
  Date: 2019/1/10
  Time: 8:32
--%>
<%--
    一般用于正文侧边栏：
    包括 搜索，热评文章，所有标签，随机文章 等小工具
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%--博客主体-右侧侧边栏 start--%>
<div id="sidebar" class="widget-area all-sidebar"
     style="position: relative; overflow: visible; box-sizing: border-box; min-height: 1px;">

    <%--搜索框--%>
    <aside class="widget widget_search">
        <div class="searchbar">
            <form method="get" id="searchform1" action="/search">
                    <span> <input type="text" value="" name="keywords" id="s1" placeholder="输入搜索内容" required="">
                        <button type="submit" id="searchsubmit1">搜索</button>
                    </span>
            </form>
        </div>
        <div class="clear"></div>
    </aside>
    <%--搜索框--%>

    <%--热评文章 start--%>
    <aside class="widget hot_comment" >
        <h3 class="widget-title">
            <i class="fa fa-bars"></i>最新文章
        </h3>
        <div id="hot_comment_widget">
            <ul>
                <c:forEach items="${newArticleList}" var="n">
                    <li>
                        <a href="/article/${n.articleId}" rel="bookmark" title=" (${n.articleCommentCount}条评论)">
                                ${n.articleTitle}
                        </a>
                        <span style="float: right;"><fmt:formatDate value="${n.articleCreateTime}" pattern="yyyy-MM-dd"/></span>
                    </li>
                </c:forEach>
            </ul>
        </div>
        <div class="clear"></div>
    </aside>
    <%--热评文章 end--%>



</div>
<%--博客主体-右侧侧边栏 end--%>