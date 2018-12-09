<!DOCTYPE HTML>
<html>
<head>
    <%@ include file="/head.jsp" %>
</head>
<body>
<%@ include file="/nav.jsp" %>

<!--导航条-->
<nav class="breadcrumb">
    <div class="container"><i class="Hui-iconfont">&#xe67f;</i> <a href="/" class="c-primary">首页</a> <span
            class="c-gray en">&gt;</span> <span class="c-gray">关于</span></div>
</nav>

<section class="container">
    <div class="container-fluid">
        <div class="about">
            <h2>Just about me</h2>
            <ul>
                <p>一枚正在努力进步的javaWeb程序员。专长领域为Web开发、服务器端开发，目前正在向全栈工程师进发。。。</p>
            </ul>
            <h2>About my blog</h2>
            <ul>
                <p>域 名：wfyvv.com 注册于2017年02月02日</p>
                <p>服务器：腾讯云服务器 ，于2017年02月23日完成备案</p>
                <p>备案号：皖ICP备17002922号</p>
                <p>本站定位为IT技术博客站，博客内容主要涉及编程语言、前端开发、服务端开发及一些热门技术等方面，同时分享实用的学习和开发资料。</p>
            </ul>
            <h2>Contact me</h2>
            <ul>
                <p><i class="Hui-iconfont">&#xe67b;</i>qq : *********暂不公开 : (</p>
                <p><i class="Hui-iconfont">&#xe6d1;</i>git：<a href="https://git.oschina.net/wilco" class="blog_link">https://git.oschina.net/wilco</a>
                </p>
                <p><i class="Hui-iconfont">&#xe63b;</i>email : <a class="blog_link" href="mailto:wfyv@qq.com">wfyv@qq.com</a>
                </p>
            </ul>
        </div>

    </div>
</section>
<footer class="footer mt-20">
    <div class="container-fluid" id="foot">
        <p>Copyright &copy; 2016-2017 www.wfyvv.com <br>
            <a href="http://www.miitbeian.gov.cn/" target="_blank">皖ICP备17002922号</a><br>
        </p>
    </div>
</footer>

<script> $(function () {
    $(window).on("scroll", backToTopFun);
    backToTopFun();
}); </script>
</body>
</html>
