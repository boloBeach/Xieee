<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">    
  <title>Happy Day -- detail</title>     
  <meta http-equiv="pragma" content="no-cache">
  <meta http-equiv="cache-control" content="no-cache">
  <meta http-equiv="expires" content="0">    
  <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
  <meta http-equiv="description" content="This is my page">
  <link href="styles/reset.css" rel="stylesheet" type="text/css">
  <link href="styles/font-awesome.min.css" rel="stylesheet" type="text/css">
  <link href="styles/style.css" rel="stylesheet" type="text/css">

  <script type="text/javascript" src="scripts/plugins/jquery/jquery.min.js"></script>
  <script type="text/javascript" src="scripts/index.js"></script>
 </head>
 <body>
 	 <div class="index-title">
        <ul>
            <li><a href="./frontPage/login.jsp" class="ft12">登陆</a></li>
            <li><a href="./frontPage/register.jsp" class="ft12">注册</a></li>
            <li><a href="" class="ft12">投诉</a></li>
        </ul>
    </div>
    <div class="index-container">
        <!--header start-->
        <div class="index-header">
            <div class="index-head">
                <div class="index-logo ft20">Happy Day</div>
                <div class="index-rss">
                    <ul>
                        <li>
                            <a class="qq">
                                <i></i>
                                <span class="gray">
                                    <em class="black">订阅</em><br>
                                    QQ邮箱
                                </span>
                            </a>
                        </li>
                    </ul>
                    <div class="clear"></div>
                    <br>
                    <div class="index-search">
                        <input type="text" class="ft12" id="search">
                        <i></i>
                    </div>
                </div>
                <div class="clear"></div>
            </div>
            <div class="index-nav">
                <ul>
                    <li class="on"><a href="./frontPage/index.jsp" class="ft14">首页</a></li>
                    <li><a href="" class="ft14">今日囧图</a></li>
                    <li><a href="" class="ft14">搞笑gif</a></li>
                    <li><a href="" class="ft14">专业吐槽</a></li>
                    <li><a href="" class="ft14">恶搞ps</a></li>
                    <li><a href="" class="ft14">搞笑漫画</a></li>
                    <!--<li><a href="" class="ft14">MOVIES</a></li>-->
                    <!--<li><a href="" class="ft14">MUSIC</a></li>-->
                </ul>
            </div>
        </div>
        <!--header end-->

        <!--content start-->
        <div class="index-content">
            <div class="index-content-left">
                <div class="index-content-left-title">
                    <span class="ft14 gray">
                        <i class="icon icon-map-marker float-left"></i>&nbsp;
                        当前位置：<a href="" class="ft12">首页</a>&nbsp;»&nbsp;<a href="" class="ft12">今日囧图</a>
                    </span>
                </div>
                <div class="index-content-left-item">
                    <h1 class="ft20">Beautiful flying people</h1>
                    <div class="item-info ft12">
                        <i class="gray">by</i>&nbsp;&nbsp;themefuse&nbsp;
                        <i class="gray">on 2014/12/29</i>&nbsp;
                        0 comments
                        <span class="item-type item-type-4"></span>
                    </div>
                    <div class="item-content ft14">
                        React components implement a render() method that takes input data and returns what to display. This example uses an XML-like syntax called JSX. Input data that is passed into the component can be accessed by render() via this.props.<br>
                        React components implement a render() method that takes input data and returns what to display. This example uses an XML-like syntax called JSX. Input data that is passed into the component can be accessed by render() via this.props.<br>
                        React components implement a render() method that takes input data and returns what to display. This example uses an XML-like syntax called JSX. Input data that is passed into the component can be accessed by render() via this.props.<br>
                    </div>
                    <div class="item-assess">
                        <a class="good" title="顶一个">
                            <i class="icon icon-hand-up"></i>10
                        </a>
                        <a class="bad" title="且...">
                            <i class="icon icon-thumbs-down"></i>10
                        </a>
                        <a class="bad" title="老图">
                            <i class="icon icon-hand-down"></i>老图(10)
                        </a>
                        <a class="collect" title="我要收藏">
                            <i class="icon icon-heart"></i>收藏
                        </a>
                    </div>
                    <div>
                        <div class="bdsharebuttonbox float-right"><a href="#" class="bds_more" data-cmd="more"></a><a href="#" class="bds_qzone" data-cmd="qzone"></a><a href="#" class="bds_tsina" data-cmd="tsina"></a><a href="#" class="bds_tqq" data-cmd="tqq"></a><a href="#" class="bds_renren" data-cmd="renren"></a><a href="#" class="bds_weixin" data-cmd="weixin"></a></div>
                        <script>window._bd_share_config={"common":{"bdSnsKey":{},"bdText":"","bdMini":"2","bdPic":"","bdStyle":"0","bdSize":"16"},"share":{},"image":{"viewList":["qzone","tsina","tqq","renren","weixin"],"viewText":"分享到：","viewSize":"16"},"selectShare":{"bdContainerClass":null,"bdSelectMiniList":["qzone","tsina","tqq","renren","weixin"]}};with(document)0[(getElementsByTagName('head')[0]||body).appendChild(createElement('script')).src='http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion='+~(-new Date()/36e5)];</script>
                    </div>
                    <div class="clear"></div>
                    <div class="item-next">
                        <span class="float-left ft12">
                            上一篇：
                            <a href="">XX</a>
                        </span>
                        <span class="float-right ft12">
                            下一篇：
                            <a href="">UU</a>
                        </span>
                    </div>
                    <div class="clear"></div>
                    <div class="item-comment-write">
                        <form>
                            <textarea id="comment" class="ft14"></textarea>
                            <input type="button" value="发表评论">
                        </form>
                    </div>
                    <div class="clear"></div>
                    <div class="item-comment ft12">
                        <h2>评论：</h2>
                        <ul>
                            <li>
                                <img src="images/user.png">
                                <div>
                                    <span class="name gray">XX</span>
                                    <span class="says black">搞笑</span>
                                    <span class="time gray">1天前
                                        <em>
                                            <i class="tread"></i>(21)
                                        </em>
                                        <em>
                                            <i class="favour"></i>(23)
                                        </em>
                                    </span>
                                </div>
                            </li>
                            <li>
                                <img src="images/user.png">
                                <div>
                                    <span class="name gray">XX</span>
                                    <span class="says black">搞笑</span>
                                    <span class="time gray">1天前
                                        <em>
                                            <i class="tread"></i>(21)
                                        </em>
                                        <em>
                                            <i class="favour"></i>(23)
                                        </em>
                                    </span>
                                </div>
                            </li>
                            <li>
                                <img src="images/user.png">
                                <div>
                                    <span class="name gray">XX</span>
                                    <span class="says black">搞笑</span>
                                    <span class="time gray">1天前
                                        <em>
                                            <i class="tread"></i>(21)
                                        </em>
                                        <em>
                                            <i class="favour"></i>(23)
                                        </em>
                                    </span>
                                </div>
                            </li>
                        </ul>
                    </div>
                    <div class="clear"></div>
                </div>
            </div>
            <div class="index-content-right">
                Right Content
            </div>
            <div class="clear"></div>
            <div class="index-content-contact ft14">
                <ul>
                    <li><i class="g"></i>Happy Day</li>
                    <li><a href="./frontPage/aboutus.jsp">关于我们</a></li>
                    <li><a href="./frontPage/contact.jsp">联系我们</a></li>
                </ul>
                <ul>
                    <li><i class="r"></i>友情链接</li>
                    <li><a>百度贴吧</a></li>
                </ul>
                <ul>
                    <li><i class="b"></i>商务合作</li>
                    <li><a>合作伙伴</a></li>
                </ul>
                <ul>
                    <li><i class="a"></i>关注我们</li>
                    <li><a>微信</a></li>
                    <li><a>微博</a></li>
                </ul>
                <div class="clear"></div>
            </div>
        </div>
    </div>
    <div class="index-footer">
        <p class="ft12 gray">&copy;2014 Made By <i>Lihuabest</i>.All rights Reserved.</p>
    </div>
 </body>
</html>