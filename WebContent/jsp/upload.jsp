
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
	    function doc_upload_success(file, data) {
	        var json = $.parseJSON(data)
	        
	        $(this).bjuiajax('ajaxDone', json)
	        if (json[BJUI.keys.statusCode] == BJUI.statusCode.ok) {
	            $('#doc_pic').val(json.filename)
	            $('#doc_span_pic').html('已上传图片：<img src="'+ json.filename +'" width="100">')
	        }
	    }
	</script>
<div class="bjui-pageHeader">
</div>

<div class="bjui-pageContent">
	<div>upload</div>
	<div style="display:inline-block; vertical-align:middle;">
	    <div id="doc_pic_up" data-toggle="upload" data-uploader="doc/form/ajaxPic.html" 
	        data-file-size-limit="1024000000"
	        data-file-type-exts="*.jpg;*.png;*.gif;*.mpg"
	        data-multi="true"
	        data-on-upload-success="doc_upload_success"
	        data-icon="cloud-upload"></div>
	    <input type="hidden" name="doc.pic" value="" id="doc_pic">
	</div>
	<span id="doc_span_pic"></span>
</div>
