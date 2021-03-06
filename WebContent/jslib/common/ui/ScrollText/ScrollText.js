﻿/**
 * @fileOverview 文字滚动
 * @version 1.0
 */
var HJ = HJ || {};
HJ.ui = HJ.ui || {};
+(function ($) {
	HJ.ui.ScrollText = function(args){
		this.args={
			speed:10,
			timeOut:2500,
			autoStart:true,
			isSmoothScroll:false,
			lineHeight:29,
			nextBtnId:null,
			preBtnId:null,
			scrollObjId:null
		};
		
		for(property in args)  this.args[property] = args[property];
		this.speed = this.args.speed;
		this.timeOut = this.args.timeOut;	
		this.autoStart = this.args.autoStart;
		this.isSmoothScroll = this.args.isSmoothScroll;
		this.lineHeight = this.args.lineHeight;
		this.stopScroll = false;
		
		this.nextBtn = null;
		this.preBtn = null;
		this.scrollObj = this.$(this.args.scrollObjId);

		this.init();
	}
	HJ.ui.ScrollText.prototype={
		/**
		 * @ignore		
		 */
		init:function(){
			if(this.args.preBtnId){
				this.preBtn = this.$(this.args.preBtnId);		
			}		
			if(this.args.nextBtnId){
				this.nextBtn = this.$(this.args.nextBtnId);
			}

			if(this.preBtn){
				this.preBtn.onclick = this.getMethod(this,"previous");
				this.preBtn.onmouseover = this.getMethod(this,"mouseOver");
				this.preBtn.onmouseout = this.getMethod(this,"mouseOut");
			}
			if(this.nextBtn){
				this.nextBtn.onclick = this.getMethod(this,"next");
				this.nextBtn.onmouseover = this.getMethod(this,"mouseOver");
				this.nextBtn.onmouseout = this.getMethod(this,"mouseOut");				
			}
			this.scrollObj.innerHTML += this.scrollObj.innerHTML;
			this.scrollObj.onmouseover = this.getMethod(this,"mouseOver");
			this.scrollObj.onmouseout = this.getMethod(this,"mouseOut");
			if(this.autoStart){
				this.start();
			}
		},
		/**
		 * 开始滚动		
		 */
		start:function(){
		  if(this.autoScrollTimer){
			   clearInterval(this.autoScrollTimer);
			}		
	    if(this.isSmoothScroll){
			   if(this.autoScrollTimer){
				   clearInterval(this.autoScrollTimer);
				 }
		  	 this.autoScrollTimer = setInterval(this.getMethod(this,"smoothScroll"),this.speed);
		  }else{
		     this.autoScrollTimer = setInterval(this.getMethod(this,"autoScroll"),this.timeOut);
		  }
		},
	  	/**
		 * 停止滚动
		 */
		stop:function(){
			clearInterval(this.autoScrollTimer);
		},
		/**
		 * @ignore		
		 */
		mouseOver:function(){this.scrollStop=true;},
		/**
		 * @ignore		
		 */	
		mouseOut:function(){this.scrollStop=false;},
		/**
		 * @ignore		
		 */	
		autoScroll:function(){		
	    if(this.scrollStop){return ;}
	    this.scrollObj.scrollTop++;
	    if(parseInt(this.scrollObj.scrollTop)%this.lineHeight!=0){
	    	this.scrollTimer = setTimeout(this.getMethod(this,"autoScroll"),this.speed);
	    }else{
	    	if(parseInt(this.scrollObj.scrollTop)>=parseInt(this.scrollObj.scrollHeight)/2){
	    		this.scrollObj.scrollTop = 0;
	    	}
	    	clearTimeout(this.scrollTimer);
	    }	   
		},
		/**
		 * @ignore		
		 */
		smoothScroll:function(){
	    if(this.scrollStop){return;}
	    this.scrollObj.scrollTop++;
	    if(parseInt(this.scrollObj.scrollTop)>=parseInt(this.scrollObj.scrollHeight)/2){
	    	this.scrollObj.scrollTop = 0;
	    }
		},
		/**
		 * @ignore		
		 */
		scroll:function(direction){
			if(direction=="pre"){
			   this.scrollObj.scrollTop--;
			}else if(direction="next"){
				 this.scrollObj.scrollTop++;
			}
			if(parseInt(this.scrollObj.scrollTop)>=parseInt(this.scrollObj.scrollHeight)/2){
				this.scrollObj.scrollTop=0;}
			else if(parseInt(this.scrollObj.scrollTop)<=0){
				this.scrollObj.scrollTop=parseInt(this.scrollObj.scrollHeight)/2;
			}
			if(parseInt(this.scrollObj.scrollTop)%this.lineHeight!=0){
				this.scrollTimer=setTimeout(this.getMethod(this,"scroll",direction),this.speed);
			}
		},
		/**
		 * 上一条	
		 */
		previous:function(){
			this.scrollStop=true;
			this.scroll("pre");
		},
		/**
		 * 下一条	
		 */
		next:function(){		
			this.scrollStop=true;
			this.scroll("next");
		},
		/**
		 * @ignore		
		 */	
		$:function(id){return document.getElementById(id);},
		/**
		 * @ignore		
		 */
		getMethod:function(variable,method,param){return function(){variable[method](param);}}
	}
})(jQuery);