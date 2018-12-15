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
            class="c-gray en">&gt;</span> <span class="c-gray"><a class="c-primary" href="/article"
                                                                  data-hover="学无止尽">学无止尽</a></span> <span
            class="c-gray en">&gt;</span> <span
            class="c-gray">${data.title}</span></div>
</nav>

<section class="container pt-20">

    <div class="row w_main_row">


        <div class="col-lg-9 col-md-9 w_main_left">
            <%--主要内容区--%>
            <div class="panel panel-default  mb-20">
                <div class="panel-body pt-10 pb-10">
                    <h2 class="c_titile">${data.title}</h2>
                    <p class="box_c"><span class="d_time">发布时间：<fmt:formatDate value="${data.createTime}"
                                                                               pattern="yyyy-MM-dd hh:mm:ss"/></span><span>编辑：${data.aname}</span><span>阅读（${data.clicks}）</span>
                    </p>
                    <ul class="infos">
                        ${data.content}
                    </ul>

                    <div class="keybq">
                        <p><span>关键字</span>：
                            <c:forEach items="${data.labels}" var="label">
                                <span class="label label-default">${label}</span>
                            </c:forEach>
                        </p><%--<a class="label label-default">空间</a>--%>
                    </div>


                    <div class="nextinfo">
                        <c:if test="${data.more.last!=null}">
                            <p class="last">上一篇：<a href="/detail/${data.more.last.aid}">${data.more.last.title}</a></p>
                        </c:if>
                        <c:if test="${data.more.next!=null}">
                            <p class="next">下一篇：<a href="/detail/${data.more.next.aid}">${data.more.next.title}</a></p>
                        </c:if>
                    </div>

                </div>
            </div>

            <%--<div class="panel panel-default  mb-20">
                <div class="tab-category">
                    <a href=""><strong>评论区</strong></a>
                </div>
                <div class="panel-body">
                    <div class="panel-body" style="margin: 0 3%;">
                        <div class="mb-20">
                            <ul class="commentList">
                                &lt;%&ndash;评论&ndash;%&gt;
                                &lt;%&ndash;<li class="item cl"> <a href="#"><i class="avatar size-L radius"><img alt="" src="http://qzapp.qlogo.cn/qzapp/101388738/1CF8425D24660DB8C3EBB76C03D95F35/100"></i></a>
                                    <div class="comment-main">
                                        <header class="comment-header">
                                            <div class="comment-meta"><a class="comment-author" href="#">老王</a>
                                                <time title="2014年8月31日 下午3:20" datetime="2014-08-31T03:54:20" class="f-r">2014-8-31 15:20</time>
                                            </div>
                                        </header>
                                        <div class="comment-body">
                                            <p> 是的</p>
                                        </div>
                                    </div>
                                </li>&ndash;%&gt;
                                <li class="item cl"><a href="#"><i class="avatar size-L radius"><img alt=""
                                                                                                     src="http://qzapp.qlogo.cn/qzapp/101388738/696C8A17B3383B88804BA92ECBAA5D81/100"></i></a>
                                    <div class="comment-main">
                                        <header class="comment-header">
                                            <div class="comment-meta"><a class="comment-author" href="#">老王</a>
                                                <time title="2014年8月31日 下午3:20" datetime="2014-08-31T03:54:20"
                                                      class="f-r">2014-8-31 15:20
                                                </time>
                                            </div>
                                        </header>
                                        <div class="comment-body">
                                            <p> +1</p>
                                        </div>
                                    </div>
                                </li>

                            </ul>

                        </div>
                        <div class="line"></div>
                        <!--用于评论-->
                        <div class="mt-20" id="ct">
                            <div id="err" class="Huialert Huialert-danger hidden radius">成功状态提示</div>
                            <textarea id="textarea1" name="comment" style="height:200px;"
                                      placeholder="看完不留一发？"> </textarea>
                            <div class="text-r mt-10">
                                <button onclick="getPlainTxt()" class="btn btn-primary radius"> 发表评论</button>
                            </div>
                        </div>
                        <!--用于回复-->
                        <div class="comment hidden mt-20">
                            <div id="err2" class="Huialert Huialert-danger hidden radius">成功状态提示</div>
                            <textarea class="textarea" style="height:100px;"> </textarea>
                            <button onclick="hf(this);" type="button" class="btn btn-primary radius mt-10">回复</button>
                            <a class="cancelReply f-r mt-10">取消回复</a>
                        </div>

                    </div>
                </div>
            </div>--%>
        </div>
        <div class="col-lg-3 col-md-3">
            <!--点击排行-->
            <div class="bg-fff box-shadow radius mb-20">
                <div class="tab-category">
                    <a href=""><strong>点击排行</strong></a>
                </div>
                <div class="tab-category-item">
                    <ul class="index_recd clickTop">
                        <c:forEach items="${top}" var="topItem">
                            <li>
                                <a href="/detail/${topItem.aid}">${topItem.title}</a>
                                <p class="hits"><i class="Hui-iconfont" title="点击量">&#xe6c1;</i>${topItem.clicks}</p>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
            </div>

            <!--图片-->
            <%--<div class="bg-fff box-shadow radius mb-20">
                <div class="tab-category">
                    <a href=""><strong>扫我关注</strong></a>
                </div>
                <div class="tab-category-item">
                    <img data-original="temp/gg.jpg" class="img-responsive lazyload" alt="响应式图片">
                </div>
            </div>--%>

        </div>
    </div>
</section>


<%--footer--%>
<%@ include file="/footer.jsp" %>

<script type="text/javascript">
    $(function () {
        $("img.lazyload").lazyload({failurelimit: 3});

        wangEditor.config.printLog = false;
        var editor1 = new wangEditor('textarea1');
        editor1.config.menus = ['insertcode', 'quote', 'bold', '|', 'img', 'emotion', '|', 'undo', 'fullscreen'];
        editor1.config.emotions = {
            'default': {title: '老王表情', data: 'plugin/wangEditor/emotions1.data'},
            'default2': {title: '老王心情', data: 'plugin/wangEditor/emotions3.data'},
            'default3': {title: '顶一顶', data: 'plugin/wangEditor/emotions2.data'}
        };
        editor1.create();

        //show reply
        $(".hf").click(function () {
            pId = $(this).attr("name");
            $(this).parents(".commentList").find(".cancelReply").trigger("click");
            $(this).parent(".comment-body").append($(".comment").clone(true));
            $(this).parent(".comment-body").find(".comment").removeClass("hidden");
            $(this).hide();
        });
        //cancel reply
        $(".cancelReply").on('click', function () {
            $(this).parents(".comment-body").find(".hf").show();
            $(this).parents(".comment-body").find(".comment").remove();
        });
    });

</script>
</body>
</html>
