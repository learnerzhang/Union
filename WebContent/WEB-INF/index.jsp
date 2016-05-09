<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
	String pre = request.getContextPath();
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="<%=pre %>/resources/style/index.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="<%=pre %>/resources/js/jquery.js"></script>
<script type="text/javascript" src="<%=pre %>/resources/js/jquery.min.js"></script>
<title>大学工会首页</title>
<script type="text/javascript">
	$(document).ready(function(){
		$("#info").click(function(){
			$("#content").empty().load("<%=request.getContextPath()%>/infos");
		});
		$("#new").click(function(){
			$("#content").empty().load("<%=request.getContextPath()%>/news");
		});
		
		$("#base").click(function(){
			$("#content").empty().load("<%=request.getContextPath()%>/bases");
		});
		$("#resource").click(function(){
			$("#content").empty().load("<%=request.getContextPath()%>/resources");
		});
	});
</script>
</head>
<body>
	<div id="header">
		<div class="logo">
			<a href="http://gh.pku.edu.cn"></a>
		</div>
		<div class="t_text">
			<!-- <a href="http://www.pku.edu.cn/">北大主页</a>|<a onclick="window.external.AddFavorite('http://gh.pku.edu.cn','北大工会')"
				href="javascript:;">加入收藏</a> -->
		</div>
		<div class="t_search">
			<form name="formsearch" action="/plus/search.php">
				<table width="332" border="0">
					<tr>
						<td width="52%"><input name="q" type="text" value="输入搜索内容" onfocus="if(this.value=='输入搜索内容'){this.value='';}" onblur="if(this.value==''){this.value='输入搜索内容';}" id="search-keyword" class="inputtext" /></td>
						<td width="23%">
							<select name="searchType" size="1">
								<option value="1">标题</option>
								<option value="2">作者</option>
							</select>
						</td>
						<td width="25%"><input type="submit" class="inputbtn"
							value="搜 索" /></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	<div id="nav">
		<ul>
			<li><a href='<%=request.getContextPath() %>/'>网站首页</a></li>

			<li><a id="info" href='#'>公告信息</a></li>

			<li><a id="new" href='#'>新闻动态</a></li>
			
			<li><a id="base" href='#'>基层动态</a></li>
			
			<li><a id="resource" href='#'>资源下载</a></li>
		</ul>
	</div>
	<div id="content">
		<div class="t_content_left">
			<h2 class="t_co_title">图片新闻</h2>
			<div class="t_banner">
				<div class="slidebox-01">
					<ul class="slidepic-01">
						<li><a href="/plus/view.php?aid=2485"><img
								alt="“全国三八红旗手”走进北京大学专场座谈会举行"
								src="upload/img/001b230f-2557-4ddb-ad1e-99703b767689.jpg"
								width="252" height="180" /></a></li>
						<li><a href="/plus/view.php?aid=2483"><img
								alt="平民学校第11期开学典礼举行"
								src="upload/img/056e3283-92aa-4482-8146-3070a0a98f1b.jpg" width="252"
								height="180" /></a></li>
						<li><a href="/plus/view.php?aid=2455"><img
								alt="北京大学工会第十八届委员会第十次全体（扩大）会议召开"
								src="upload/img/056e3283-92aa-4482-8146-3070a0a98f1b.jpg" width="252"
								height="180" /></a></li>
						<li><a href="/plus/view.php?aid=2376"><img
								alt="北京大学第十五届青年教师教学基本功比赛(文、理科)顺利举行"
								src="upload/img/056e3283-92aa-4482-8146-3070a0a98f1b.jpg" width="252"
								height="180" /></a></li>
						<li><a href="/plus/view.php?aid=2384"><img
								alt="2015年工会干部培训暨工作研讨会召开"
								src="upload/img/056e3283-92aa-4482-8146-3070a0a98f1b.jpg" width="252"
								height="180" /></a></li>
						<li><a href="/plus/view.php?aid=2396"><img
								alt="教职工羽毛球队夺得北京市教育系统第二片组赛冠军"
								src="upload/img/056e3283-92aa-4482-8146-3070a0a98f1b.jpg" width="252"
								height="180" /></a></li>

					</ul>
					<div class="slidebtn-01">
						<ul>
							<li class="current">1</li>
							<li>2</li>
							<li>3</li>
							<li>4</li>
							<li>5</li>
							<li>6</li>
						</ul>
					</div>
				</div>
				<!--slidebox-01 end-->
				<script type="text/javascript">
					$(function() {

						var size = $('.slidebtn-01>ul>li').length;
						var frist = 0;
						var datetime;
						$('.slidebtn-01 li').mouseover(function() {
							frist = $('.slidebtn-01 li').index(this);
							showpic(frist);
						}).eq(0).mouseover();

						$('.slidebox-01').hover(function() {
							clearInterval(datetime);
						}, function() {
							datetime = setInterval(function() {
								showpic(frist)
								frist++;
								if (frist == size) {
									frist = 0;
								}
							}, 3000);
						}).trigger('mouseleave');

						function showpic(frist) {
							var imgheight = $('.slidebox-01').width();
							$('.slidepic-01').stop(true, false).animate({
								left : -imgheight * frist
							}, 600)
							$('.slidebtn-01 li').removeClass('current').eq(
									frist).addClass('current');
						};

					});
				</script>
			</div>
			<div class="t_texfn">
				<div class="t_texfn1">
					<div width="246" height="25" marginwidth="0" marginheight="0" frameborder="0" scrolling="no">
						<span style="color:#0067b0; font-size:14px;font-weight:bold; padding-top:7px;">发稿排行榜(4-6月)</span>
					</div>
				</div>
				<div class="t_texfn2">
					<div width="225" align="left" height="232" marginwidth="0" marginheight="0" frameborder="0" scrolling="no">
						<div style="margin-left: 40px;">
							<ul style="padding-top:1px;">
								<li style="overflow:hidden;line-height:20px;height:20px;width:205px; list-style-type:none; margin-left:-25px;color:#000000;background:url(resources/images/pic9-1.jpg) no-repeat 0; padding-left:1px;font-size:12px;"><span style="float:left;margin-left:20px;">外国语学院工会</span><span style="float:right;">发稿数：7篇</span></li>
								<li style="overflow:hidden;line-height:20px;height:20px;width:205px; list-style-type:none; margin-left:-25px;color:#000000;background:url(resources/images/pic9-2.jpg) no-repeat 0; padding-left:1px;font-size:12px;"><span style="float:left;margin-left:20px;">经济学院工会</span><span style="float:right;">发稿数：7篇</span></li>
								<li style="overflow:hidden;line-height:20px;height:20px;width:205px; list-style-type:none; margin-left:-25px;color:#000000;background:url(resources/images/pic9-3.jpg) no-repeat 0; padding-left:1px;font-size:12px;"><span style="float:left;margin-left:20px;">平民学校</span><span style="float:right;">发稿数：5篇</span></li>
								<li style="overflow:hidden;line-height:20px;height:20px;width:205px; list-style-type:none; margin-left:-25px;color:#000000;background:url(resources/images/pic9-4.jpg) no-repeat 0; padding-left:1px;font-size:12px;"><span style="float:left;margin-left:20px;">化学与分子工程学院</span><span style="float:right;">发稿数：4篇</span></li>
								<li style="overflow:hidden;line-height:20px;height:20px;width:205px; list-style-type:none; margin-left:-25px;color:#000000;background:url(resources/images/pic9-5.jpg) no-repeat 0; padding-left:1px;font-size:12px;"><span style="float:left;margin-left:20px;">燕园街道办事处工会</span><span style="float:right;">发稿数：3篇</span></li>
								<li style="overflow:hidden;line-height:20px;height:20px;width:205px; list-style-type:none; margin-left:-25px;color:#000000;background:url(resources/images/pic9-6.jpg) no-repeat 0; padding-left:1px;font-size:12px;"><span style="float:left;margin-left:20px;">环境科学与工程学院</span><span style="float:right;">发稿数：3篇</span></li>
								<li style="overflow:hidden;line-height:20px;height:20px;width:205px; list-style-type:none; margin-left:-25px;color:#000000;background:url(resources/images/pic9-7.jpg) no-repeat 0; padding-left:1px;font-size:12px;"><span style="float:left;margin-left:20px;">后勤分工会</span><span style="float:right;">发稿数：3篇</span></li>
								<li style="overflow:hidden;line-height:20px;height:20px;width:205px; list-style-type:none; margin-left:-25px;color:#000000;background:url(resources/images/pic9-8.jpg) no-repeat 0; padding-left:1px;font-size:12px;"><span style="float:left;margin-left:20px;">机关分工会</span><span style="float:right;">发稿数：2篇</span></li>
								<li style="overflow:hidden;line-height:20px;height:20px;width:205px; list-style-type:none; margin-left:-25px;color:#000000;background:url(resources/images/pic9-9.jpg) no-repeat 0; padding-left:1px;font-size:12px;"><span style="float:left;margin-left:20px;">地球与空间科学学院</span><span style="float:right;">发稿数：2篇</span></li>
								<li style="overflow:hidden;line-height:20px;height:20px;width:205px; list-style-type:none; margin-left:-25px;color:#000000;background:url(resources/images/pic9-10.jpg) no-repeat 0; padding-left:1px;font-size:12px;"><span style="float:left;margin-left:20px;">校医院工会</span><span style="float:right;">发稿数：2篇</span></li>
							</ul>
						</div>
					</div>
				</div>
				<div class="t_texfn3"></div>
			</div>
		</div>
		<div class="t_content_conter">
			<h2 class="t_title">
				<a id="infos" href="#">MORE+</a>公告信息
			</h2>

			<ul class="t_list">
				<li><span>2016-05-05</span><a href="/plus/view.php?aid=2546"
					title="关于开展2016年北京市师德榜样（先锋）候选人推荐活动的通知">关于开展2016年北京市师德榜样（先锋）候选人推荐活动的通知

				</a></li>
				<li><span>2016-05-05</span><a href="/plus/view.php?aid=2543"
					title="关于举办2016年北京大学教职工毽球赛的通知">关于举办2016年北京大学教职工毽球赛的通知 </a></li>
				<li><span>2016-05-05</span><a href="/plus/view.php?aid=2540"
					title="关于召开北京大学青年教师教学论坛暨第十五届青年教师教学基本功比赛颁奖会的通知">关于召开北京大学青年教师教学论坛暨第十五届青年教师教学基本功

				</a></li>
				<li><span>2016-04-21</span><a href="/plus/view.php?aid=2511"
					title="关于开展2016年工会理论与调查研究立项工作的通知">关于开展2016年工会理论与调查研究立项工作的通知 </a></li>

			</ul>
			<h2 class="t_title mt20p">
				<a id="news" href="#">MORE+</a>新闻动态
			</h2>

			<ul class="t_list">

				<li><span>2016-05-05</span><a href="/plus/view.php?aid=2542"
					title="北京大学工会举办讲座，普及保险基本知识">北京大学工会举办讲座，普及保险基本知识 </a></li>
				<li><span>2016-05-04</span><a href="/plus/view.php?aid=2539"
					title="校工会荣获北京市总工会2015年度“工会工作标兵单位”称号">校工会荣获北京市总工会2015年度“工会工作标兵单位”称号

				</a></li>
				<li><span>2016-04-29</span><a href="/plus/view.php?aid=2535"
					title="北京大学工会致敬劳模送祝福">北京大学工会致敬劳模送祝福 </a></li>
				<li><span>2016-04-27</span><a href="/plus/view.php?aid=2529"
					title="“关爱健康、走进北大”大型义诊活动">“关爱健康、走进北大”大型义诊活动 </a></li>
				<li><span>2016-04-26</span><a href="/plus/view.php?aid=2522"
					title="最美不过夕阳红，踏着晨光送歌声——北大教职工健美操团赴温泉敬老院慰问表演成功举行">最美不过夕阳红，踏着晨光送歌声——北大教职工健美操团赴温泉敬

				</a></li>
				<li><span>2016-04-19</span><a href="/plus/view.php?aid=2504"
					title="“幸福学堂”第二期结业仪式暨结业讲座举行">“幸福学堂”第二期结业仪式暨结业讲座举行 </a></li>


			</ul>
			<h2 class="t_title mt20p">
				<a id="bases" href="#">MORE+</a>基层动态
			</h2>

			<ul class="t_list">
				<li><span>2016-05-03</span><a href="/plus/view.php?aid=2537"
					title="特写：外院教工为健康中国而运动"> 特写：外院教工为健康中国而运动</a></li>
				<li><span>2016-05-03</span><a href="/plus/view.php?aid=2536"
					title="动力中心工会“送健康”"> 动力中心工会“送健康”</a></li>
				<li><span>2016-04-29</span><a href="/plus/view.php?aid=2534"
					title="工学院参加2016年北京大学运动会获佳绩"> 工学院参加2016年北京大学运动会获佳绩</a></li>
				<li><span>2016-04-28</span><a href="/plus/view.php?aid=2533"
					title="计算中心组织教职工参观海昏侯墓考古展"> 计算中心组织教职工参观海昏侯墓考古展</a></li>
				<li><span>2016-04-28</span><a href="/plus/view.php?aid=2532"
					title="机关代表队2016年校运会取得佳绩"> 机关代表队2016年校运会取得佳绩</a></li>
				<li><span>2016-04-28</span><a href="/plus/view.php?aid=2531"
					title="厚积薄发，再创佳绩"> 厚积薄发，再创佳绩</a></li>
				<li><span>2016-04-26</span><a href="/plus/view.php?aid=2526"
					title="经济学院积极参加2016年北京大学田径运动会"> 经济学院积极参加2016年北京大学田径运动会</a></li>

			</ul>
		</div>
		<div class="t_content_right">
			<div class="t_rttitle">管理员登录</div>
			<div class="t_lifst">




				<form name="form1">
					<input type="hidden" name="gotopage" value="" /> <input
						type="hidden" name="dopost" value="login" /> <input
						name='adminstyle' type='hidden' value='newdedecms' />
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td height="27">&nbsp;用户名：<input name="username" id="username"
								type="text" value="" size="10" /></td>
							<td rowspan="2"><input name="" type="submit" value=""
								class="inputbtn1" /></td>
						</tr>
						<tr>
							<td height="27">&nbsp;密&nbsp;&nbsp;码：<input type="password" name="password"
								id="password" value="" size="10" /></td>
						</tr>
					</table>
				</form>
			</div>
			<div class="t_lifstft"></div>

			<div class="mt10p">
				<a href="mailto:ghzxxx@pku.edu.cn"><img
					src="resources/images/zxxx.jpg" width="234" height="74" /></a>
			</div>

			<div class="mt10p">
				<a href="http://apply.pku.edu.cn/"><img
					src="resources/images/54321.png" width="234" height="80" /></a>
			</div>
			<div class="mt10p">
				<a href="http://regist.pku.edu.cn/"><img
					src="resources/images/i_67.png" width="234" height="80" /></a>
			</div>
			<div class="mt10p">
				<a href="http://gh.pku.edu.cn/plus/list.php?tid=161"><img
					src="resources/images/dabuzou.png" width="234" height="78" /></a>
			</div>
			<div class="t_rttitle mt10p">
				<a href="#"></a>相关连接
			</div>
			<div class="t_lifsts">
				<table>
					<tr>
						<td style="padding: 5px;"><a href='#' target='_blank'>中华全国总工会</a></td>
						<td style="padding: 5px;"><a href='#' target='_blank'>中国教科文卫体工会</a></td>
					</tr>
					<tr>
						<td style="padding: 5px;"><a href='#' target='_blank'>北京市总工会</a></td>
						<td style="padding: 5px;"><a href='#' target='_blank'>中国教科文卫体工会</a></td>
					</tr>
				</table>
			</div>
			<div class="t_lifstft"></div>
		</div>
	</div>
	<div class="footer">

		<div class="footer_div">
			<p class="footer_div_mbx"></p>
			<p class="footer_div_dbs">

				版权所有 xx大学工会 Copyright 2016 All Rights Reserved<br />
				通讯地址：xx大学工会 邮编：100001 <a href="#" target='_blank'>Power by DedeCms</a>
			</p>
		</div>

	</div>

</body>
</html>