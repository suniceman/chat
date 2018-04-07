<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<title>在线聊天</title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/layui.css">
<style>
html{background-color: #666;}
</style>
</head>
<body>


<script src="${pageContext.request.contextPath}/dist/layui.js"></script>
<script>
var im = {
        getUid:function () {
          var uid = "${sessionScope.user.id}";
            return uid;
        },
        init:function(){
            if ('WebSocket' in window){
                var uid = im.getUid();
                if(!uid){
                	location.href="${pageContext.request.contextPath}/user/login.action";
                }else {
                    var socketUrl = 'ws://localhost:8080/chat/websocket/' + uid;
                    socket = new WebSocket(socketUrl);
                    im.startListener();
                }
            } else {
                alert('当前浏览器不支持WebSocket功能，请更换浏览器访问。');
            }
        },
        startListener:function () {
            if (socket) {
                // 连接发生错误的回调方法
                socket.onerror = function () {
                    console.log("连接失败!");
                };
                // 连接成功建立的回调方法
                socket.onopen = function (event) {
                    console.log("连接成功");
                }
                // 接收到消息的回调方法
                socket.onmessage = function (event) {
                    console.log("接收到消息");
                    im.handleMessage(event.data);
                }
                // 连接关闭的回调方法
                socket.onclose = function () {
                    console.log("关闭连接！!");
                }
            }
        },
        handleMessage:function (msg) {
            var msg = JSON.parse(msg);
            console.log(msg[0].msg);
            layim.getMessage(msg[0].msg);
        }
    };
    
    im.init();

layui.use('layim', function(layim){
  window.layim = layim;
  $ = layui.jquery;
  //演示自动回复
  var autoReplay = [
    '您好，我现在有事不在，一会再和您联系。', 
    '你没发错吧？face[微笑] ',
    '洗澡中，请勿打扰，偷窥请购票，个体四十，团体八折，订票电话：一般人我不告诉他！face[哈哈] ',
    '你好，我是主人的美女秘书，有什么事就跟我说吧，等他回来我会转告他的。face[心] face[心] face[心] ',
    'face[威武] face[威武] face[威武] face[威武] ',
    '<（@￣︶￣@）>',
    '你要和我说话？你真的要和我说话？你确定自己想说吗？你一定非说不可吗？那你说吧，这是自动回复。',
    'face[黑线]  你慢慢说，别急……',
    '(*^__^*) face[嘻嘻] ，是贤心吗？'
  ];
  
  //基础配置
  layim.config({

    //初始化接口
    init: {
      url: '${pageContext.request.contextPath}/user/getList.action'
      ,data: {}
    }
    
    //或采用以下方式初始化接口
    /*
    ,init: {
      mine: {
        "username": "LayIM体验者" //我的昵称
        ,"id": "100000123" //我的ID
        ,"status": "online" //在线状态 online：在线、hide：隐身
        ,"remark": "在深邃的编码世界，做一枚轻盈的纸飞机" //我的签名
        ,"avatar": "a.jpg" //我的头像
      }
      ,friend: []
      ,group: []
    }
    */
    

    //查看群员接口
    ,members: {
      url: '${pageContext.request.contextPath}/json/getMembers.json'
      ,data: {}
    }
    
    //上传图片接口
    ,uploadImage: {
      url: '/upload/image' //（返回的数据格式见下文）
      ,type: '' //默认post
    } 
    
    //上传文件接口
    ,uploadFile: {
      url: '/upload/file' //（返回的数据格式见下文）
      ,type: '' //默认post
    }
    
    ,isAudio: true //开启聊天工具栏音频
    ,isVideo: true //开启聊天工具栏视频
    
    //扩展工具栏
    ,tool: [{
      alias: 'code'
      ,title: '代码'
      ,icon: '&#xe64e;'
    }]
    
    //,brief: true //是否简约模式（若开启则不显示主面板）
    
    ,title: '在线聊天' //自定义主面板最小化时的标题
    //,right: '100px' //主面板相对浏览器右侧距离
    //,minRight: '90px' //聊天面板最小化时相对浏览器右侧距离
    ,initSkin: '5.jpg' //1-5 设置初始背景
    //,skin: ['aaa.jpg'] //新增皮肤
    //,isfriend: false //是否开启好友
    //,isgroup: false //是否开启群组
    //,min: true //是否始终最小化主面板，默认false
    ,notice: true //是否开启桌面消息提醒，默认false
    //,voice: false //声音提醒，默认开启，声音文件为：default.mp3
    
    ,msgbox: layui.cache.dir + 'css/modules/layim/html/msgbox.html' //消息盒子页面地址，若不开启，剔除该项即可
    ,find: layui.cache.dir + 'css/modules/layim/html/find.html' //发现页面地址，若不开启，剔除该项即可
    ,chatLog: layui.cache.dir + 'css/modules/layim/html/chatLog.html' //聊天记录页面地址，若不开启，剔除该项即可
    
  });

  /*
  layim.chat({
    name: '在线客服-小苍'
    ,type: 'kefu'
    ,avatar: 'http://tva3.sinaimg.cn/crop.0.0.180.180.180/7f5f6861jw1e8qgp5bmzyj2050050aa8.jpg'
    ,id: -1
  });
  layim.chat({
    name: '在线客服-心心'
    ,type: 'kefu'
    ,avatar: 'http://tva1.sinaimg.cn/crop.219.144.555.555.180/0068iARejw8esk724mra6j30rs0rstap.jpg'
    ,id: -2
  });
  layim.setChatMin();*/

  //监听在线状态的切换事件
  layim.on('online', function(data){
    //console.log(data);
  });
  
  //监听自定义工具栏点击，以添加代码为例
  layim.on('tool(code)', function(insert){
    layer.prompt({
      title: '插入代码'
      ,formType: 2
      ,shade: 0
    }, function(text, index){
      layer.close(index);
      insert('[pre class=layui-code]' + text + '[/pre]'); //将内容插入到编辑器
    });
  });
  
  //监听layim建立就绪
  layim.on('ready', function(res){

    //console.log(res.mine);
    
    layim.msgbox(5); //模拟消息盒子有新消息，实际使用时，一般是动态获得
  });

  //监听发送消息
  layim.on('sendMessage', function(data){
    var my = data.mine;
    var message = my.content;
    var To = data.to;
    var message = {
    	mine: {
    		id:data.mine.id,
    		name: data.mine.username,
    		avatar: data.mine.avatar,
    		content: data.mine.content
    	},
    	to:{
    		id:data.to.id,
    		username: data.to.username,
    		sign: data.to.sign,
    		type: data.to.type,
    		avatar: data.to.avatar
    	}
    }
    
    socket.send(JSON.stringify(message));
    
    //演示自动回复
    //setTimeout(function(){
    //  var obj = {};
    //  if(To.type === 'group'){
    //    obj = {
    //      username: '模拟群员'+(Math.random()*100|0)
    //      ,avatar: layui.cache.dir + 'images/face/'+ (Math.random()*72|0) + '.gif'
   //       ,id: To.id
   //       ,type: To.type
   //       ,content: autoReplay[Math.random()*9|0]
   //     }
    //  } else {
    //    obj = {
    //      username: To.name
   //       ,avatar: To.avatar
   //       ,id: To.id
   //       ,type: To.type
    //      ,content: autoReplay[Math.random()*9|0]
   //     }
   //     layim.setChatStatus('<span style="color:#FF5722;">在线</span>');
    //  }
   //   layim.getMessage(obj);
  //  }, 1000);
  });

  //监听查看群员
  layim.on('members', function(data){
    //console.log(data);
  });
  
  //监听聊天窗口的切换
  layim.on('chatChange', function(res){
    var type = res.data.type;
    if(type === 'friend'){
      //模拟标注好友状态
      //layim.setChatStatus('<span style="color:#FF5722;">在线</span>');
    } else if(type === 'group'){
      //模拟系统消息
      layim.getMessage({
        system: true
        ,id: res.data.id
        ,type: "group"
        ,content: '模拟群员'+(Math.random()*100|0) + '加入群聊'
      });
    }
  });
  
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
  //监听签名修改
  layim.on('sign', function(sign){
	  $.ajax({
	      type : "post",
	      url : "${pageContext.request.contextPath}/user/changeSign.action",
	      data : "sign=" + sign,
	      dataType : "text",
	      success : function(resData) {
	    	  if (resData === 'success') {
	              layer.msg('修改个性签名成功', {
	                  icon: 1
	                });
	    	  } else {
                  layer.msg('修改个性签名失败');
	    	  }
	      }
	  });
  });
});
</script>
</body>
</html>

