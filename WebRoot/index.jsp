<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
			String basePath = request.getScheme() + "://"
					+ request.getServerName() + ":" + request.getServerPort()
					+ path + "/";
%>

<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>在线聊天</title>
<link rel="stylesheet" href="./layui.css">

</head>
<body>
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 50px;">
  <legend>面板外的操作示例</legend>
</fieldset>
 
  <div class="site-demo-button">
	  <button class="layui-btn site-demo-layim" data-type="chat">自定义会话</button>
	  <button class="layui-btn site-demo-layim" data-type="message">接受好友的消息</button>
	  <button class="layui-btn site-demo-layim" data-type="messageAudio">接受音频消息</button>
	  <button class="layui-btn site-demo-layim" data-type="messageVideo">接受视频消息</button>
	  <button class="layui-btn site-demo-layim" data-type="messageTemp">接受临时会话消息</button>
	  
	  <br>
	  
	  <button class="layui-btn site-demo-layim" data-type="add">申请好友</button>
	  <button class="layui-btn site-demo-layim" data-type="addqun">申请加群</button>
	  <button class="layui-btn site-demo-layim" data-type="addFriend">同意好友</button>
	  <button class="layui-btn site-demo-layim" data-type="addGroup">增加群组到主面板</button>
	  <button class="layui-btn site-demo-layim" data-type="removeFriend">删除主面板好友</button>
	  <button class="layui-btn site-demo-layim" data-type="removeGroup">删除主面板群组</button>
	  
	  <br>
	  <button class="layui-btn site-demo-layim" data-type="setGray">置灰离线好友</button>
	  <button class="layui-btn site-demo-layim" data-type="unGray">取消好友置灰</button>
	  <a href="http://layim.layui.com/kefu.html" class="layui-btn site-demo-layim" target="_blank">客服模式</a>
	  <button class="layui-btn site-demo-layim" data-type="mobile">移动端版本</button>
	  
	  <br>
  </div>
	<script src="./static/layui/layui.js"></script>
	<script>
		layui.use('layim', function(layim) {
			//先来个客服模式压压精
			layim.config({
			    init: {
			        url: '/chat/user/getList.action'
			        ,data: {}
			      },
				title: 'Web聊天',
				isfriend: true, //是否开启好友
			    isgroup: true, //是否开启群组
				brief : false,
				notice: true, //是否开启桌面消息提醒，默认false
				voice: false, //声音提醒，默认开启，声音文件为：default.mp3
				msgbox: './static/layui/css/modules/layim/html/msgbox.html', //消息盒子页面地址，若不开启，剔除该项即可
				initSkin: '3.jpg', //1-5 设置初始背景
				tool: [{
				      alias: 'code'
				      ,title: '代码'
				      ,icon: '&#xe64e;'
				    }]
			//是否简约模式（如果true则不显示主面板）
			}).chat({
				name : '客服姐姐',
				type : 'friend',
				avatar : 'http://tp1.sinaimg.cn/5619439268/180/40030060651/1',
				id : -2
			});
		  //面板外的操作
		  var $ = layui.jquery, active = {
		    chat: function(){
		      //自定义会话
		      layim.chat({
		        name: '小闲'
		        ,type: 'friend'
		        ,avatar: '//tva3.sinaimg.cn/crop.0.0.180.180.180/7f5f6861jw1e8qgp5bmzyj2050050aa8.jpg'
		        ,id: 1008612
		      });
		      layer.msg('也就是说，此人可以不在好友面板里');
		    }
		    ,message: function(){
		      //制造好友消息
		      layim.getMessage({
		        username: "贤心"
		        ,avatar: "//tp1.sinaimg.cn/1571889140/180/40030060651/1"
		        ,id: "100001"
		        ,type: "friend"
		        ,content: "嗨，你好！欢迎体验LayIM。演示标记："+ new Date().getTime()
		        ,timestamp: new Date().getTime()
		      });
		    }
		    ,messageAudio: function(){
		      //接受音频消息
		      layim.getMessage({
		        username: "林心如"
		        ,avatar: "//tp3.sinaimg.cn/1223762662/180/5741707953/0"
		        ,id: "76543"
		        ,type: "friend"
		        ,content: "audio[http://gddx.sc.chinaz.com/Files/DownLoad/sound1/201510/6473.mp3]"
		        ,timestamp: new Date().getTime()
		      });
		    }
		    ,messageVideo: function(){
		      //接受视频消息
		      layim.getMessage({
		        username: "林心如"
		        ,avatar: "//tp3.sinaimg.cn/1223762662/180/5741707953/0"
		        ,id: "76543"
		        ,type: "friend"
		        ,content: "video[http://www.w3school.com.cn//i/movie.ogg]"
		        ,timestamp: new Date().getTime()
		      });
		    }
		    ,messageTemp: function(){
		      //接受临时会话消息
		      layim.getMessage({
		        username: "小酱"
		        ,avatar: "//tva1.sinaimg.cn/crop.7.0.736.736.50/bd986d61jw8f5x8bqtp00j20ku0kgabx.jpg"
		        ,id: "198909151014"
		        ,type: "friend"
		        ,content: "临时："+ new Date().getTime()
		      });
		    }
		    ,add: function(){
		      //实际使用时数据由动态获得
		      layim.add({
		        type: 'friend'
		        ,username: '麻花疼'
		        ,avatar: '//tva1.sinaimg.cn/crop.0.0.720.720.180/005JKVuPjw8ers4osyzhaj30k00k075e.jpg'
		        ,submit: function(group, remark, index){
		          layer.msg('好友申请已发送，请等待对方确认', {
		            icon: 1
		            ,shade: 0.5
		          }, function(){
		            layer.close(index);
		          });
		          
		          //通知对方
		          /*
		          $.post('/im-applyFriend/', {
		            uid: info.uid
		            ,from_group: group
		            ,remark: remark
		          }, function(res){
		            if(res.status != 0){
		              return layer.msg(res.msg);
		            }
		            layer.msg('好友申请已发送，请等待对方确认', {
		              icon: 1
		              ,shade: 0.5
		            }, function(){
		              layer.close(index);
		            });
		          });
		          */
		        }
		      });
		    }
		    ,addqun: function(){
		      layim.add({
		        type: 'group'
		        ,username: 'LayIM会员群'
		        ,avatar: '//tva2.sinaimg.cn/crop.0.0.180.180.50/6ddfa27bjw1e8qgp5bmzyj2050050aa8.jpg'
		        ,submit: function(group, remark, index){
		          layer.msg('申请已发送，请等待管理员确认', {
		            icon: 1
		            ,shade: 0.5
		          }, function(){
		            layer.close(index);
		          });
		          
		          //通知对方
		          /*
		          $.post('/im-applyGroup/', {
		            uid: info.uid
		            ,from_group: group
		            ,remark: remark
		          }, function(res){
		          
		          });
		          */
		        }
		      });
		    }
		    ,addFriend: function(){
		      var user = {
		        type: 'friend'
		        ,id: 1234560
		        ,username: '李彦宏' //好友昵称，若申请加群，参数为：groupname
		        ,avatar: '//tva4.sinaimg.cn/crop.0.0.996.996.180/8b2b4e23jw8f14vkwwrmjj20ro0rpjsq.jpg' //头像
		        ,sign: '全球最大的中文搜索引擎'
		      }
		      layim.setFriendGroup({
		        type: user.type
		        ,username: user.username
		        ,avatar: user.avatar
		        ,group: layim.cache().friend //获取好友列表数据
		        ,submit: function(group, index){
		          //一般在此执行Ajax和WS，以通知对方已经同意申请
		          //……
		          
		          //同意后，将好友追加到主面板
		          layim.addList({
		            type: user.type
		            ,username: user.username
		            ,avatar: user.avatar
		            ,groupid: group //所在的分组id
		            ,id: user.id //好友ID
		            ,sign: user.sign //好友签名
		          });
		          
		          layer.close(index);
		        }
		      });
		    }
		    ,addGroup: function(){
		      layer.msg('已成功把[Angular开发]添加到群组里', {
		        icon: 1
		      });
		      //增加一个群组
		      layim.addList({
		        type: 'group'
		        ,avatar: "//tva3.sinaimg.cn/crop.64.106.361.361.50/7181dbb3jw8evfbtem8edj20ci0dpq3a.jpg"
		        ,groupname: 'Angular开发'
		        ,id: "12333333"
		        ,members: 0
		      });
		    }
		    ,removeFriend: function(){
		      layer.msg('已成功删除[凤姐]', {
		        icon: 1
		      });
		      //删除一个好友
		      layim.removeList({
		        id: 121286
		        ,type: 'friend'
		      });
		    }
		    ,removeGroup: function(){
		      layer.msg('已成功删除[前端群]', {
		        icon: 1
		      });
		      //删除一个群组
		      layim.removeList({
		        id: 101
		        ,type: 'group'
		      });
		    }
		    //置灰离线好友
		    ,setGray: function(){
		      layim.setFriendStatus(168168, 'offline');
		      
		      layer.msg('已成功将好友[马小云]置灰', {
		        icon: 1
		      });
		    }
		    //取消好友置灰
		    ,unGray: function(){
		      layim.setFriendStatus(168168, 'online');
		      
		      layer.msg('成功取消好友[马小云]置灰状态', {
		        icon: 1
		      });
		    }
		    //移动端版本
		    ,mobile: function(){
		      var device = layui.device();
		      var mobileHome = '/layim/demo/mobile.html';
		      if(device.android || device.ios){
		        return location.href = mobileHome;
		      }
		      var index = layer.open({
		        type: 2
		        ,title: '移动版演示 （或手机扫右侧二维码预览）'
		        ,content: mobileHome
		        ,area: ['375px', '667px']
		        ,shadeClose: true
		        ,shade: 0.8
		        ,end: function(){
		          layer.close(index + 2);
		        }
		      });
		      layer.photos({
		        photos: {
		          "data": [{
		            "src": "http://cdn.layui.com/upload/2016_12/168_1481056358469_50288.png",
		          }]
		        }
		        ,anim: 0
		        ,shade: false
		        ,success: function(layero){
		          layero.css('margin-left', '350px');
		        }
		      });
		    }
		  };
		  $('.site-demo-layim').on('click', function(){
		    var type = $(this).data('type');
		    active[type] ? active[type].call(this) : '';
		  });
		});
	</script>
</body>
</html>
