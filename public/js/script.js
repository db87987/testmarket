// A.V.Plotnikov, verstalo.com

$(document).ready(function(){
	// переключение изображениий в карточке товара
	$(".cs-sm-images li a").click(function(){
		
		var linkRel = $(this).attr("rel");
		var linkHref = $(this).attr("href");
		
		$(".big-img #" + linkRel).show().siblings("img").hide();
		$("#link_" + linkRel).show().siblings("a").hide();
		
		$(this).parent().addClass("active").siblings("li").removeClass("active");
		
		return false;
	});
	
	// Минус
	$(".bb-quantity .minus").click(function(){
		var thisInput = $(this).siblings("input");
		var thisInpVal = parseInt($(thisInput).val());
		if(thisInpVal > 1)
		{
			$(thisInput).val(thisInpVal - 1);
		}
		return false;
	});
	
	// Плюс
	$(".bb-quantity .plus").click(function(){
		var thisInput = $(this).siblings("input");
		var thisInpVal = parseInt($(thisInput).val());
		
		$(thisInput).val(thisInpVal + 1);
		
		return false;
	});
	
	// Клик по табам с описаниями в карточке товара
	$(".ce-tabs ul li a").click(function(){
		var thisHref = $(this).attr("href");
		
		$(this).parent().addClass("active").siblings("li").removeClass("active");
		$("#" + thisHref).show().siblings("div").hide();
		
		return false;
	});
 });