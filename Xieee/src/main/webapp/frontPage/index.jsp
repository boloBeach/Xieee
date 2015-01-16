<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">  
   <title>邪恶搞笑gif</title>        
  <meta http-equiv="pragma" content="no-cache">
  <meta http-equiv="cache-control" content="no-cache">
  <meta http-equiv="expires" content="0">    
  <meta http-equiv="keywords" content="搞笑,gif,内涵图">
  <meta http-equiv="description" content="This is my page">
   <link href="./styles/reset.css" rel="stylesheet" type="text/css">
    <link href="./styles/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="styles/style.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="./scripts/plugins/jquery/jquery.min.js"></script>
    <script type="text/javascript" src="./scripts/index.js"></script>
 </head>
 <body>
  <div class="index-title">
        <ul>
        <c:choose>
        	<c:when test="${!empty user_name }">
        		<li class="ft12">${user_name}欢迎您</li>
        	</c:when>
        	<c:otherwise>
        		<li><a href="./frontPage/login.jsp" class="ft12">登陆</a></li>
        	</c:otherwise>
        </c:choose>
        	<%-- <c:if test="${1==1}">
        		<li class="ft14">${user_name}欢迎您</li>
        	</c:if> 
        	<c:if test="${1=1}">
           	 	<li><a href="./frontPage/login.jsp" class="ft12">登陆</a></li>
            </c:if> --%>
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
                    <li>
                        <a href="" class="ft14">今日囧图</a>
                        <ul class="index-child-nav">
                            <li><a href="" class="">二级菜单1</a></li>
                            <li><a href="" class="">二级菜单2</a></li>
                            <li><a href="" class="">二级菜单3</a></li>
                        </ul>
                    </li>
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
                    <span class="ft18 gray">
                        最新内容
                    </span>
                    <ul id="sort">
                        <li data-sort="time"><a href="javascript:;" class="ft12 black-light">时间</a></li>
                        <li data-sort="heat" class="on"><a href="javascript:;" class="ft12 black-light">热度</a></li>
                    </ul>
                </div>
                <!-- 内容部分-->
                <div class="index-content-left-item">
                    <h1 class="ft20">从 7 行代码到 1 个按钮解决支付，半年来 Ping++ 做了什么？</h1>
                    <div class="item-info ft12">
                        <i class="gray">小编：</i>&nbsp;&nbsp;小李子&nbsp;
                        <i class="gray">2014/12/29</i>&nbsp;
                        评论(25)
                        <span class="item-type item-type-1"></span>
                    </div>
                    <div class="item-content ft14">
                        <p>首推全新 SDK 产品 [壹收款] Beta 版。相比之前的 SDK，[壹收款] 提供了内嵌支付页面和完成页面，进一步降低了开发的成本。</p>
                        <p>支付平台扩增了微信公众账号支付，银联手机支付，百度钱包支付，SDK 所适配的后台开发语言丰富到 6 个，SDK 可按照 Server 端及 Client 端分类。</p>
                        <p>这次正式亮相让 Ping++ 变得更加丰满，更丰富的支持依旧是为了让开发者获得更简单的接入方式。</p>
                        <p>「壹收款」是基于「Ping++ SDK」的全新支付产品，只需要一个按钮，一行代码，就可以实现一键收款。</p>
                        <p>简单来说，「壹收款」就是一个完整打包的支付页面，开发者只要在应用代码中加入「壹收款」的代码即可完成获得支付页面和对应的支付跳转功能。</p>
                        <img src="images/test.jpg">
                    </div>
                    <div class="item-more">
                        <i class="fa fa-plus-circle fa-lg green"></i>
                        <a class="green" href="detail.html" target="_blank">阅读更多</a>
                    </div>
                </div>
                <div class="index-content-left-item">
                    <h1 class="ft20">［盘点2014］智能手机是现实生活的遥控器，上门服务加速涌来</h1>
                    <div class="item-info ft12">
                        <i class="gray">小编：</i>&nbsp;&nbsp;小李子&nbsp;
                        <i class="gray">2014/12/29</i>&nbsp;
                        评论(2)
                        <span class="item-type item-type-1"></span>
                    </div>
                    <div class="item-content ft14">
                        <img src="images/test2.jpg">
                    </div>
                    <div class="item-more">
                        <i class="fa fa-plus-circle fa-lg green"></i>
                        <a class="green" href="./frontPage/detail.jsp" target="_blank">阅读更多</a>
                    </div>
                </div>
                <div class="index-content-left-item">
                    <h1 class="ft20">Beautiful flying people</h1>
                    <div class="item-info ft12">
                        <i class="gray">by</i>&nbsp;&nbsp;themefuse&nbsp;
                        <i class="gray">on 2014/12/29</i>&nbsp;
                        0 comments
                        <span class="item-type item-type-3"></span>
                    </div>
                    <div class="item-content ft14">
                        React components implement a render() method that takes input data and returns what to display. This example uses an XML-like syntax called JSX. Input data that is passed into the component can be accessed by render() via this.props.<br>
                        React components implement a render() method that takes input data and returns what to display. This example uses an XML-like syntax called JSX. Input data that is passed into the component can be accessed by render() via this.props.<br>
                        React components implement a render() method that takes input data and returns what to display. This example uses an XML-like syntax called JSX. Input data that is passed into the component can be accessed by render() via this.props.<br>
                    </div>
                    <div class="item-more">
                        <i class="fa fa-plus-circle fa-lg green"></i>
                        <a class="green" href="./frontPage/detail.jsp" target="_blank">阅读更多</a>
                    </div>
                </div>
            </div>

            <div class="index-content-right">
                <div class="index-content-ringht-catalog">
            		<div class="index-content-ringht-title ft18">
               			<span>标签</span>
               		</div>
               		<ul class="ft16">
               			<li><a href="#" title="搞笑漫画">搞笑漫画</a></li>
               			<li><a href="#" title="专业吐槽">专业吐槽</a></li>
               			<li><a href="#" title="搞笑漫画">搞笑漫画</a></li>
               			<li><a href="#" title="搞笑漫画">搞笑漫画</a></li>
               			<li><a href="#" title="搞笑漫画">搞笑漫画</a></li>
               			<li><a href="#" title="搞笑漫画">搞笑漫画</a></li>
               			<li><a href="#" title="搞笑漫画">搞笑漫画</a></li>
               		</ul>
            	</div>
            
               <div class="index-content-ringht-randpicture">
               		<div class="index-content-ringht-title ft18">
               			<span>随机日志</span>
               		</div>
               		<div class="index-content-rightItem ft12">
               			<ul>
               				<!-- this is foreach 12 pages  -->
               				<li><a href="./frontPage/detail.jsp" class="blank" title="姑娘你别胡思乱想了，世界上爱你的人多着呢">姑娘你别胡思乱想了，世界上爱你的人多着呢</a></li>
               				<li><a href="./frontPage/detail.jsp" class="blank" title="冷漫画：做一个像老师一样的男子汉。[10P]">冷漫画：做一个像老师一样的男子汉。[10P]</a></li>
               				<li><a href="./frontPage/detail.jsp" class="blank" title="冷漫画：做一个像老师一样的男子汉。[10P]">冷漫画：做一个像老师一样的男子汉。[10P]</a></li>
               				<li><a href="./frontPage/detail.jsp" class="blank" title="冷漫画：做一个像老师一样的男子汉。[10P]">冷漫画：做一个像老师一样的男子汉。[10P]</a></li>
               				<li><a href="./frontPage/detail.jsp" class="blank" title="冷漫画：做一个像老师一样的男子汉。[10P]">冷漫画：做一个像老师一样的男子汉。[10P]</a></li>
               				<li><a href="./frontPage/detail.jsp" class="blank" title="冷漫画：做一个像老师一样的男子汉。[10P]">冷漫画：做一个像老师一样的男子汉。[10P]</a></li>
               				<li><a href="./frontPage/detail.jsp" class="blank" title="冷漫画：做一个像老师一样的男子汉。[10P]">冷漫画：做一个像老师一样的男子汉。[10P]</a></li>
               				<li><a href="./frontPage/detail.jsp" class="blank" title="冷漫画：做一个像老师一样的男子汉。[10P]">冷漫画：做一个像老师一样的男子汉。[10P]</a></li>
               				<li><a href="./frontPage/detail.jsp" class="blank" title="冷漫画：做一个像老师一样的男子汉。[10P]">冷漫画：做一个像老师一样的男子汉。[10P]</a></li>
               				<li><a href="./frontPage/detail.jsp" class="blank" title="冷漫画：做一个像老师一样的男子汉。[10P]">冷漫画：做一个像老师一样的男子汉。[10P]</a></li>
               				<li><a href="./frontPage/detail.jsp" class="blank" title="冷漫画：做一个像老师一样的男子汉。[10P]">冷漫画：做一个像老师一样的男子汉。[10P]</a></li>
               				<li><a href="./frontPage/detail.jsp" class="blank" title="冷漫画：做一个像老师一样的男子汉。[10P]">冷漫画：做一个像老师一样的男子汉。[10P]</a></li>
               			</ul>
               		</div>
               </div>
               
               <!-- this is 24 hours hot articles -->
               <div class="index-content-ringht-hotarticles">
               		<div class="index-content-ringht-title ft18">
               			<span>24小时热评文章</span>
               		</div>
               		<div class="index-content-rightItem ft12">
               			<ul>
               				<!-- this is foreach 12 pages  -->
               				<li><a href="./frontPage/detail.jsp" class="blank" title="姑娘你别胡思乱想了，世界上爱你的人多着呢">姑娘你别胡思乱想了，世界上爱你的人多着呢</a></li>
               				<li><a href="./frontPage/detail.jsp" class="blank" title="冷漫画：做一个像老师一样的男子汉。[10P]">冷漫画：做一个像老师一样的男子汉。[10P]</a></li>
               				<li><a href="./frontPage/detail.jsp" class="blank" title="冷漫画：做一个像老师一样的男子汉。[10P]">冷漫画：做一个像老师一样的男子汉。[10P]</a></li>
               				<li><a href="./frontPage/detail.jsp" class="blank" title="冷漫画：做一个像老师一样的男子汉。[10P]">冷漫画：做一个像老师一样的男子汉。[10P]</a></li>
               				<li><a href="./frontPage/detail.jsp" class="blank" title="冷漫画：做一个像老师一样的男子汉。[10P]">冷漫画：做一个像老师一样的男子汉。[10P]</a></li>
               				<li><a href="./frontPage/detail.jsp" class="blank" title="冷漫画：做一个像老师一样的男子汉。[10P]">冷漫画：做一个像老师一样的男子汉。[10P]</a></li>
               				<li><a href="./frontPage/detail.jsp" class="blank" title="冷漫画：做一个像老师一样的男子汉。[10P]">冷漫画：做一个像老师一样的男子汉。[10P]</a></li>
               				<li><a href="./frontPage/detail.jsp" class="blank" title="冷漫画：做一个像老师一样的男子汉。[10P]">冷漫画：做一个像老师一样的男子汉。[10P]</a></li>
               				<li><a href="./frontPage/detail.jsp" class="blank" title="冷漫画：做一个像老师一样的男子汉。[10P]">冷漫画：做一个像老师一样的男子汉。[10P]</a></li>
               				<li><a href="./frontPage/detail.jsp" class="blank" title="冷漫画：做一个像老师一样的男子汉。[10P]">冷漫画：做一个像老师一样的男子汉。[10P]</a></li>
               				<li><a href="./frontPage/detail.jsp" class="blank" title="冷漫画：做一个像老师一样的男子汉。[10P]">冷漫画：做一个像老师一样的男子汉。[10P]</a></li>
               				<li><a href="./frontPage/detail.jsp" class="blank" title="冷漫画：做一个像老师一样的男子汉。[10P]">冷漫画：做一个像老师一样的男子汉。[10P]</a></li>
               			</ul>
               		</div>
               </div>
               
               <!-- this is new comments -->
               <div class="index-content-ringht-newcomments">
               		<div class="index-content-ringht-title ft18">
               			<span>最新评论</span>
               		</div>
               		<div class="index-content-ringht-newcommentsusers ft12">
               			<ul>
               				<li>
               					<div class="user-picture">
	               					<span>
	               						<img alt="傻逼" src="http://ds.cdncache.org/avatar-50/359/133312.jpg"> 
	               					</span>
               					</div>
               					<div class="user-comments">
               						<span class="ft16">
               						傻逼<span class="newcomment-username ft16">• 2015-01-05 12:12:12</span>
               						</span>
               						<div>
               							<a href="#" title="这里是评论内容">这里是评论内容,这个怎么那么搞笑咯。我确认这个是很搞笑的，真的，你不相信你可以点击下来试一试。反正是笑死我了。</a>
               						</div>
               					</div>
               				</li>
               				
               				<li>
               					<div class="user-picture">
	               					<span>
	               						<img alt="傻逼" src="http://ds.cdncache.org/avatar-50/359/133312.jpg"> 
	               					</span>
               					</div>
               					<div class="user-comments">
               						<span class="ft16">
               						傻逼<span class="newcomment-username ft16">• 2015-01-05 12:12:12</span>
               						</span>
               						<div>
               							<a href="#" title="这里是评论内容">这里是评论内容,这个怎么那么搞笑咯。我确认这个是很搞笑的，真的，你不相信你可以点击下来试一试。反正是笑死我了。</a>
               						</div>
               					</div>
               				</li>
               				
               				<li>
               					<div class="user-picture">
	               					<span>
	               						<img alt="傻逼" src="http://ds.cdncache.org/avatar-50/359/133312.jpg"> 
	               					</span>
               					</div>
               					<div class="user-comments">
               						<span class="ft16">
               						傻逼<span class="newcomment-username ft16">• 2015-01-05 12:12:12</span>
               						</span>
               						<div>
               							<a href="#" title="这里是评论内容">这里是评论内容,这个怎么那么搞笑咯。我确认这个是很搞笑的，真的，你不相信你可以点击下来试一试。反正是笑死我了。</a>
               						</div>
               					</div>
               				</li>
               				
               				<li>
               					<div class="user-picture">
	               					<span>
	               						<img alt="傻逼" src="http://ds.cdncache.org/avatar-50/359/133312.jpg"> 
	               					</span>
               					</div>
               					<div class="user-comments">
               						<span class="ft16">
               						傻逼<span class="newcomment-username ft16">• 2015-01-05 12:12:12</span>
               						</span>
               						<div>
               							<a href="#" title="这里是评论内容">这里是评论内容,这个怎么那么搞笑咯。我确认这个是很搞笑的，真的，你不相信你可以点击下来试一试。反正是笑死我了。</a>
               						</div>
               					</div>
               				</li>
               			</ul>
               		</div>
               </div>
            </div>
            <div class="clear"></div>
            <div class="index-content-contact ft14">
                <ul>
                    <li><i class="g"></i>Happy Day</li>
                    <li><a href="./frontPage/aboutus.jsp">关于我们</a></li>
                    <li><a href="contact.html">联系我们</a></li>
                    <li><a href="./background/index.html">后台管理</a></li>
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

    <div class="image-show">
        <div class="image-content">
            <div class="">
                <img src="">
                <i></i>
            </div>
        </div>
    </div>
 </body>
</html>