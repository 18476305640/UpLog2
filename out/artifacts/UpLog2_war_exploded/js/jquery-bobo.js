(function($){
	        //扩展jQuery对象本身
	        jQuery.extend({
	            "boboTo": function (imsBox, pointsBox,moveLeft,moveRight,speed) {

				if(speed==null){
					speed=300;
				}
				/* 使两边隐藏 */

				$(moveLeft).css("display","none");
				$(moveRight).css("display","none");
				/* 容器初始化 */
				var showBoxWidth=$(imsBox).parent().width();
				$(imsBox).parent().css({
					"overflow": "hidden"

				});

				var imgBoxNumber=$(imsBox).children().length;
				var showBoxHeight=$(imsBox).parent().height();
				$(imsBox).css("marginLeft",-showBoxWidth);
				$(imsBox).css({
					"width":(showBoxWidth*(imgBoxNumber+2)),
					"display": "block"

				});
				$(imsBox).find("li").css("width",showBoxWidth);
				/* 添加左右两边 */
				var lastImgBox=$(imsBox).find("li:last-child").clone();
				var firstImgBox=$(imsBox).find("li:first-child").clone();
				imsBox.prepend(lastImgBox[0]);
				imsBox.append(firstImgBox[0]);
			     /* 添加点*/
			     for(var i=0;i<imgBoxNumber;i++){
				     $(pointsBox).append("<li></li>");
			     }


			     var thisImgBox=1;
			     function AutoMove(time){
				     $(imsBox).animate({
					     "marginLeft":-showBoxWidth*thisImgBox

				     },time);
				     AutoPoint();

			     }
			     var pointWidth= $(pointsBox).find("li").eq(1).css("width");
			     var pointBackground= $(pointsBox).find("li").eq(1).css("background");

			     function AutoPoint(thisPoint){
				     $($(pointsBox).find("li").eq(thisImgBox-1)[0]).stop().animate({
						"width":"15px"
				     },300).css("background","#47ba4c").siblings().stop().animate({
					     "width":pointWidth
				     },300).css("background",pointBackground);


			     }
			     AutoMove();
			     $(moveLeft).click(function(){
					thisImgBox--;
					AutoMove(speed);
					if(thisImgBox==0){
						thisImgBox=imgBoxNumber;
						AutoMove(0);
					}

			     });
			     $(moveRight).click(function(){

			     		thisImgBox++;
			     		AutoMove(speed);
					if(thisImgBox==imgBoxNumber+1){
						thisImgBox=1;
						AutoMove(0);
					 }

			     });
			     /* 点控制*/
			     $(pointsBox).delegate("li","click",function(){
					thisImgBox=$(this).index()+1;
					AutoMove(speed);
			     });

			     /* 屏幕改变事件 */
			     var parentBox=$(imsBox).children("li");

			     $(window).resize(function(){
			        //parentBox.css("transition","0s");/*如果想拖动没有宽度改变的过渡，请解开上下两行的注释即可*/
					showBoxWidth=$(imsBox).parent().width();
					$(imsBox).find("li").css("width",showBoxWidth);
					$(imsBox).css({
						"width":(showBoxWidth*(imgBoxNumber+2)),
					});
					AutoMove(0);
					//parentBox.css("transition","1.3s");
			     });

			     /* 移入移出时两边*/
			     var autoTimeMove=null;
			     $(imsBox).parent().mouseenter(function(){
				     $(moveLeft).fadeIn(speed+400);
				     $(moveRight).fadeIn(speed+400);
				     clearInterval(autoTimeMove);

			     }).mouseleave(function(){
				     $(moveLeft).fadeOut(speed+400);
				     $(moveRight).fadeOut(speed+400);
				     MyTimeMove();

			     });

			     /*自动滚动 */
			     MyTimeMove();
			     function MyTimeMove(){
				     autoTimeMove=setInterval(function(){
					     $(moveRight).click();
				     },3000);
			     }
			     /* 放大*/
			     var imgBox_up=$(imsBox).children("li");
			     imgBox_up.css("transition","1.3s");
			     imgBox_up.hover(function(){
				     $(this).css("transform"," scale(1.05)");
			     },function(){
				     $(this).css("transform"," scale(1)");
			     });


	            },
	           
	        });
	
})(jQuery);