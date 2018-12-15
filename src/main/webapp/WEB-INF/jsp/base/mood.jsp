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
    <div class="container"><i class="Hui-iconfont">&#xe67f;</i> <a href="/" class="c-primary">首页</a> <span
            class="c-gray en">&gt;</span> <span class="c-gray">碎言碎语</span></div>
</nav>

<section class="container mt-20">
    <div class="container-fluid">
        <div class="timeline">
            <%--一个！--%>
            <%--<div class="cd-timeline-block">
                <div class="cd-timeline-img cd-picture">
                    <img src="css/timeline/cd-icon-location.svg" alt="position">
                </div>
                <div class="cd-timeline-content">
                    <h4>测试测试</h4>
                    <p>Lao王博客测试版本上线。。Lao王博客测试版本上线。。Lao王博客测试版本上线。。Lao王博客测试版本上线。。Lao王博客测试版本上线。。Lao王博客测试版本上线。。</p>
                    <a href="http://www.wfyvv.com" class="f-r"><input class="btn btn-success size-S" type="button" value="更多"></a>
                    <span class="cd-date">2017年1月01日</span>
                </div>
            </div>--%>
            <c:forEach items="${data}" var="mood">
                <div class="cd-timeline-block">
                        <%-- <div class="cd-timeline-img cd-picture">
                             <img src="/static/img/moodTag.jpg" alt="">
                         </div>--%>
                    <div class="cd-timeline-content">
                        <span class="cd-date"><fmt:formatDate value="${mood.createTime}"
                                                              pattern="yyyy年MM月dd日 hh:mm:ss"/></span>
                        <p>${mood.content}</p>
                    </div>
                </div>
            </c:forEach>

        </div>
    </div>

</section>


<%--footer--%>
<%@ include file="/footer.jsp" %>

<script>
    $(function () {
        //on scolling, show/animate timeline blocks when enter the viewport
        $(window).on('scroll', function () {
            $('.cd-timeline-block').each(function () {
                if ($(this).offset().top <= $(window).scrollTop() + $(window).height() * 0.75 && $(this).find('.cd-timeline-img').hasClass('is-hidden')) {
                    $(this).find('.cd-timeline-img, .cd-timeline-content').removeClass('is-hidden').addClass('bounce-in');
                }
                if ($(window).scrollTop() - $(this).offset().top > 0) {
                    $(this).find('.cd-timeline-img, .cd-timeline-content').addClass('is-hidden').removeClass('bounce-in');
                }

            });
            $('.cd-timeline-block').each(function () {
                if ($(this).offset().top < $(window).scrollTop() + $(window).height() * 0.75) {
                    $(this).find('.cd-timeline-img, .cd-timeline-content').removeClass('is-hidden');
                }
            });
        });
    });

</script>
</body>
</html>
