<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
 <div class="index-content-ringht-catalog">
	<div class="index-content-ringht-title ft18">
  			<span>标签</span>
  		</div>
  		<ul class="ft16">
  			<c:forEach var="tag" items="${tag }">
  				<li><a href="#" title="${tag.key_word }">${tag.key_word }</a></li>
  			</c:forEach>
  		
  			
  			<!-- <li><a href="#" title="专业吐槽">专业吐槽</a></li>
  			<li><a href="#" title="搞笑漫画">搞笑漫画</a></li>
  			<li><a href="#" title="搞笑漫画">搞笑漫画</a></li>
  			<li><a href="#" title="搞笑漫画">搞笑漫画</a></li>
  			<li><a href="#" title="搞笑漫画">搞笑漫画</a></li>
  			<li><a href="#" title="搞笑漫画">搞笑漫画</a></li> -->
  		</ul>
</div>

  <div class="index-content-ringht-randpicture">
  		<div class="index-content-ringht-title ft18">
  			<span>随机漫画</span>
  		</div>
  		<div class="index-content-rightItem ft12">
  			<ul>
  				<!-- this is foreach 12 pages  -->
 				<li><a href="detail.html" class="blank" title="姑娘你别胡思乱想了，世界上爱你的人多着呢">姑娘你别胡思乱想了，世界上爱你的人多着呢</a></li>
 				<li><a href="detail.html" class="blank" title="冷漫画：做一个像老师一样的男子汉。[10P]">冷漫画：做一个像老师一样的男子汉。[10P]</a></li>
 				<li><a href="detail.html" class="blank" title="冷漫画：做一个像老师一样的男子汉。[10P]">冷漫画：做一个像老师一样的男子汉。[10P]</a></li>
 				<li><a href="detail.html" class="blank" title="冷漫画：做一个像老师一样的男子汉。[10P]">冷漫画：做一个像老师一样的男子汉。[10P]</a></li>
 				<li><a href="detail.html" class="blank" title="冷漫画：做一个像老师一样的男子汉。[10P]">冷漫画：做一个像老师一样的男子汉。[10P]</a></li>
 				<li><a href="detail.html" class="blank" title="冷漫画：做一个像老师一样的男子汉。[10P]">冷漫画：做一个像老师一样的男子汉。[10P]</a></li>
 				<li><a href="detail.html" class="blank" title="冷漫画：做一个像老师一样的男子汉。[10P]">冷漫画：做一个像老师一样的男子汉。[10P]</a></li>
 				<li><a href="detail.html" class="blank" title="冷漫画：做一个像老师一样的男子汉。[10P]">冷漫画：做一个像老师一样的男子汉。[10P]</a></li>
 				<li><a href="detail.html" class="blank" title="冷漫画：做一个像老师一样的男子汉。[10P]">冷漫画：做一个像老师一样的男子汉。[10P]</a></li>
 				<li><a href="detail.html" class="blank" title="冷漫画：做一个像老师一样的男子汉。[10P]">冷漫画：做一个像老师一样的男子汉。[10P]</a></li>
 				<li><a href="detail.html" class="blank" title="冷漫画：做一个像老师一样的男子汉。[10P]">冷漫画：做一个像老师一样的男子汉。[10P]</a></li>
 				<li><a href="detail.html" class="blank" title="冷漫画：做一个像老师一样的男子汉。[10P]">冷漫画：做一个像老师一样的男子汉。[10P]</a></li>
 			</ul>
 		</div>
 </div>
 
 <!-- this is 24 hours hot articles -->
 <div class="index-content-ringht-hotarticles">
 		<div class="index-content-ringht-title ft18">
 			<span>24小时热评</span>
 		</div>
 		<div class="index-content-rightItem ft12">
 			<ul>
 				<!-- this is foreach 12 pages  -->
 				<li><a href="detail.html" class="blank" title="姑娘你别胡思乱想了，世界上爱你的人多着呢">姑娘你别胡思乱想了，世界上爱你的人多着呢</a></li>
 				<li><a href="detail.html" class="blank" title="冷漫画：做一个像老师一样的男子汉。[10P]">冷漫画：做一个像老师一样的男子汉。[10P]</a></li>
 				<li><a href="detail.html" class="blank" title="冷漫画：做一个像老师一样的男子汉。[10P]">冷漫画：做一个像老师一样的男子汉。[10P]</a></li>
 				<li><a href="detail.html" class="blank" title="冷漫画：做一个像老师一样的男子汉。[10P]">冷漫画：做一个像老师一样的男子汉。[10P]</a></li>
 				<li><a href="detail.html" class="blank" title="冷漫画：做一个像老师一样的男子汉。[10P]">冷漫画：做一个像老师一样的男子汉。[10P]</a></li>
 				<li><a href="detail.html" class="blank" title="冷漫画：做一个像老师一样的男子汉。[10P]">冷漫画：做一个像老师一样的男子汉。[10P]</a></li>
 				<li><a href="detail.html" class="blank" title="冷漫画：做一个像老师一样的男子汉。[10P]">冷漫画：做一个像老师一样的男子汉。[10P]</a></li>
 				<li><a href="detail.html" class="blank" title="冷漫画：做一个像老师一样的男子汉。[10P]">冷漫画：做一个像老师一样的男子汉。[10P]</a></li>
 				<li><a href="detail.html" class="blank" title="冷漫画：做一个像老师一样的男子汉。[10P]">冷漫画：做一个像老师一样的男子汉。[10P]</a></li>
 				<li><a href="detail.html" class="blank" title="冷漫画：做一个像老师一样的男子汉。[10P]">冷漫画：做一个像老师一样的男子汉。[10P]</a></li>
 				<li><a href="detail.html" class="blank" title="冷漫画：做一个像老师一样的男子汉。[10P]">冷漫画：做一个像老师一样的男子汉。[10P]</a></li>
 				<li><a href="detail.html" class="blank" title="冷漫画：做一个像老师一样的男子汉。[10P]">冷漫画：做一个像老师一样的男子汉。[10P]</a></li>
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