<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="jslib/common/BJUI/themes/css/bootstrap.min.css" rel="stylesheet">
<link href="jslib/common/BJUI/themes/css/style.css" rel="stylesheet">
<link href="jslib/common/BJUI/themes/css/FA/css/font-awesome.min.css" rel="stylesheet">
<link href="jslib/common/ui/niceValidator/jquery.validator.css" rel="stylesheet">
<link href="jslib/common/ui/bootstrapSelect/bootstrap-select.css" rel="stylesheet">
<link href="jslib/common/ui/kindeditor_4.1.10/themes/default/default.css" rel="stylesheet">
<link href="jslib/common/ui/uploadify/css/uploadify.css" rel="stylesheet">

<script src="jslib/common/base/jquery-1.9.0.min.js"></script>
<script src="jslib/common/BJUI/js/bjui-all.js"></script>
<script src="jslib/common/ui/swfupload/swfupload.js"></script>
<script src="jslib/common/ui/kindeditor_4.1.10/kindeditor-min.js"></script>
<script src="jslib/common/ui/kindeditor_4.1.10/lang/zh_CN.js"></script>
<script src="jslib/common/ui/ztree/jquery.ztree.all-3.5.min.js"></script>
<script src="jslib/common/ui/niceValidator/jquery.validator.js"></script>
<script src="jslib/common/ui/niceValidator/jquery.validator.themes.js"></script>
<script src="jslib/common/ui/bootstrap/bootstrap.js"></script>
<script src="jslib/common/ui/bootstrapSelect/bootstrap-select.min.js"></script>
<script src="jslib/common/ui/icheck/icheck.min.js"></script>
<script src="jslib/common/ui/other/jquery.autosize.js"></script>
<script src="jslib/common/ui/uploadify/scripts/jquery.uploadify.min.js"></script>
<meta charset="utf-8">
<title>B-JUI文本编辑器以及文档上传</title>
<script type="text/javascript">
$(function() {
    BJUI.init({
        JSPATH       : '../../bjui/jslib/common/BJUI',
        PLUGINPATH   : '../../bjui/jslib/common/ui/',
       // loginInfo    : {okCall:function(){window.location='<%=request.getContextPath() %>/login.do'}}, // 会话超时后弹出登录对话框
        statusCode   : {ok:200, error:300, timeout:301}, //[可选]
        ajaxTimeout  : 50000, //[可选]全局Ajax请求超时时间(毫秒)
        alertMsg	 : {displayMode:'none', displayPosition:'middlecenter', alertTimeout:1000},
        pageInfo     : {pageCurrent:'pageCurrent', pageSize:'pageSize', orderField:'orderField', orderDirection:'orderDirection'}, //[可选]分页参数
        keys         : {statusCode:'statusCode', message:'message'}, //[可选]
        ui           : {showSlidebar:true, clientPaging:true}, //[可选]clientPaging:在客户端响应分页及排序参数
        debug        : true,    // [可选]调试模式 [true|false，默认false]
       // theme 		 : 'purple'
        // 若有Cookie['bjui_theme'],优先选择Cookie['bjui_theme']。皮肤[六种皮肤:default, orange, purple, blue, red, green]
    })
})

function doc_upload_success(file, data) {
        var json = $.parseJSON(data)
        
        $(this).bjuiajax('ajaxDone', json)
        if (json[BJUI.keys.statusCode] == BJUI.statusCode.ok) {
            $('#doc_pic').val(json.filename)
            $('#doc_span_pic').html('已上传图片：<img src="'+ json.filename +'" width="100">')
        }
    }
function MainMenuClick(event, treeId, treeNode) {
    if (treeNode.isParent) {
        var zTree = $.fn.zTree.getZTreeObj(treeId)
        
        zTree.expandNode(treeNode)
        return
    }
   
    if (treeNode.target && treeNode.target == 'dialog'){
    	
        $(event.target).dialog({id:treeNode.tabid, url:treeNode.url, title:treeNode.name})
    }else{

        $(event.target).navtab({id:treeNode.tabid, url:treeNode.url, title:treeNode.name, fresh:treeNode.fresh, external:treeNode.external})
    }
        event.preventDefault()
}
</script>
</head>
<body>
	<header id="bjui-header">
		<div id="bjui-hnav"></div>
	</header>
	<div id="bjui-container" class="clearfix">
		<div id="bjui-leftside">
			<ul id="ztree-test-demo1" class="ztree ztree_main"   data-toggle="ztree" data-on-click="MainMenuClick">
				<li data-id="1" data-pid="0" data-faicon="rss" data-faicon-close="cab">附件</li>
				<li data-id="10" data-pid="1" data-url="/bjui/jsp/upload.jsp" data-toggle="dialog" data-name="st" data-faicon="bell">附件上传</li>
				<li data-id="11" data-pid="1" data-url="/jsp/filelist.jsp" data-toggle="navtab" data-faicon="info-circle">附件列表</li>
				<li data-id="2" data-pid="0"  data-url="/jsp/editer.jsp" data-toggle="navtab" data-faicon-close="cab">HTML编辑器</li>
			</ul>
		</div>
		<!-- <div id="bjui-navtab" class="tabsPage">
			<div style="display:inline-block; vertical-align:middle;">
		    <div id="doc_pic_up" data-toggle="upload" data-uploader="upload.do" 
		        data-file-size-limit="1024000000"
		        data-file-type-exts="*.jpg;*.png;*.gif;*.mpg"
		        data-multi="true"
		        data-on-upload-success="doc_upload_success"
		        data-icon="cloud-upload"></div>
		    	<input type="hidden" name="doc.pic" value="" id="doc_pic">
			</div>
			<span id="doc_span_pic"></span>
		</div> -->
		        <div id="bjui-navtab" class="tabsPage">
            <div class="tabsPageHeader">
                <div class="tabsPageHeaderContent">
                    <ul class="navtab-tab nav nav-tabs">
                        <li data-url="home.html" class="active"><a href="javascript:;"><span><i class="fa fa-home"></i> #maintab#</span></a></li>
                    </ul>
                    
                </div>
                <div class="tabsLeft"><i class="fa fa-angle-double-left"></i></div>
                <div class="tabsRight"><i class="fa fa-angle-double-right"></i></div>
                <div class="tabsMore"><i class="fa fa-angle-double-down"></i></div>
            </div>
            <ul class="tabsMoreList">
                <li><a href="javascript:;">#maintab#</a></li>
            </ul>

            <div class="navtab-panel tabsPageContent">
                <div class="navtabPage unitBox">

                    <div class="bjui-pageHeader" style="background:#FFF;">
                        
                    </div>

                </div>
            </div>
        </div>
	</div>
	<div id="bjui-pageFooter">
		
	</div>
</body>
</html>