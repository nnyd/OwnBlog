<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML>
<html>
<head>
    <%@ include file="/header.jsp" %>
</head>
<body>
<%@ include file="/nav.jsp" %>

<!--导航条-->
<nav class="breadcrumb">
    <div class="container">
        <i class="Hui-iconfont">&#xe67f;</i><a href="/" class="c-primary">首页</a>
        <c:if test="${lab==null}">
            <span class="c-gray en">&gt;</span>学无止尽
        </c:if>
        <c:if test="${lab!=null}">
            <span class="c-gray en">&gt;</span> <a href="/article" class="c-primary">学无止尽</a>
            <span class="c-gray en">&gt;</span> <span class="c-gray"><i class="Hui-iconfont">&#xe64b;</i> ${lab}</span>
        </c:if>
    </div>
</nav>

<section class="container">
    <!--left-->
    <div class="col-sm-9 col-md-9 mt-20">


        <!--article list-->
        <ul class="index_arc">
            <c:forEach items="${articles}" var="newItem">
                <c:if test="${newItem.imgAddress!=null}">
                    <li class="index_arc_item">
                        <a href="/detail/${newItem.aid}" class="pic">
                            <img class="lazyload" data-original="${newItem.imgAddress}" alt="${newItem.title}">
                        </a>
                        <h4 class="title"><a href="/detail/${newItem.aid}">${newItem.title}</a></h4>
                        <div class="date_hits">
                            <span>${newItem.aname}</span>
                            <span><fmt:formatDate value="${newItem.createTime}" pattern="yyyy-MM-dd hh:mm:ss"/></span>
                            <span>
                                     <c:forEach items="${newItem.labels}" var="label">
                                         <a href="/article/${label}">${label}</a>
                                     </c:forEach>
                                </span>
                            <p class="hits"><i class="Hui-iconfont" title="点击量"></i>${newItem.clicks}</p>
                                <%--<p class="commonts"><i class="Hui-iconfont" title="评论"></i> <span class="cy_cmt_count">0</span>
                                </p>--%>
                        </div>
                        <div class="desc">${newItem.explain}</div>
                    </li>
                </c:if>
                <c:if test="${newItem.imgAddress==null}">
                    <li class="index_arc_item no_pic">
                        <h4 class="title"><a href="/detail/${newItem.aid}">${newItem.title}</a></h4>
                        <div class="date_hits">
                            <span>${newItem.aname}</span>
                            <span><fmt:formatDate value="${newItem.createTime}" pattern="yyyy-MM-dd hh:mm:ss"/></span>
                            <span>
                                 <c:forEach items="${newItem.labels}" var="label">
                                     <a href="/article/${label}">${label}</a>
                                 </c:forEach>
                                </span>
                            <p class="hits"><i class="Hui-iconfont" title="点击量">&#xe6c1;</i>${newItem.clicks}</p>
                                <%--<p class="commonts"><i class="Hui-iconfont" title="评论">&#xe622;</i> <span id="sourceId::105"class="cy_cmt_count">20</span>
                                </p>--%>
                        </div>
                        <div class="desc">${newItem.explain}</div>
                    </li>
                </c:if>
            </c:forEach>
        </ul>
        <%--<div class="text-c mb-20" id="moreBlog">
          <a class="btn  radius btn-block " href="javascript:;" onclick="moreBlog('${blogType.id}','${tag.name}');">点击加载更多</a>
          <a class="btn  radius btn-block hidden" href="javascript:;">加载中……</a>
      </div>		--%>
    </div>

    <!--right-->
    <div class="col-sm-3 col-md-3 mt-20">

        <!--导航-->
        <%--<div class="panel panel-primary mb-20">
              <div class="panel-body">
                  <input class="btn btn-primary radius nav-btn" type="button" value="杂谈">
                  <input class="btn btn-primary-outline radius nav-btn" type="button" value="java">
                  <input class="btn btn-primary-outline radius nav-btn" type="button" value="框架">
                  <input class="btn btn-primary-outline radius nav-btn" type="button" value="服务域名">
              </div>
          </div>--%>

        <!--热门推荐-->
        <div class="bg-fff box-shadow radius mb-20">
            <div class="tab-category">
                <a href=""><strong>热门推荐</strong></a>
            </div>
            <div class="tab-category-item">
                <ul class="index_recd">
                    <c:forEach items="${top}" var="topItem">
                        <li>
                            <a href="/detail/${topItem.aid}">${topItem.title}</a>
                            <p class="hits"><i class="Hui-iconfont" title="点击量">&#xe6c1;</i>${topItem.clicks}</p>
                        </li>
                    </c:forEach>
                </ul>
            </div>
        </div>

        <!--标签-->
        <div class="bg-fff box-shadow radius mb-20">
            <div class="tab-category">
                <a href=""><strong>标签云</strong></a>
            </div>
            <div class="tab-category-item">
                <div class="tags">
                    <c:forEach items="${labels}" var="label">
                        <a href="/article/${label}">${label}</a>
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>

</section>
<%@ include file="/footer.jsp" %>
<script>
    $(function () {
//标签
        $(".tags a").each(function () {
            var x = 9;
            var y = 0;
            var rand = parseInt(Math.random() * (x - y + 1) + y);
            $(this).addClass("tags" + rand)
        });

        $("img.lazyload").lazyload({failurelimit: 3});
    });

</script>
</body>
</html>
