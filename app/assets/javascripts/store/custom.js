$(document).ready(function(){
	
	// Аккордеон левого меню каталога
	$("#catalogue-menu > ul > li > a").click(function(){
		$(this).toggleClass("active").siblings("ul").slideToggle().
		parent().siblings("li").find("a:first").removeClass("active").siblings("ul").slideUp();
		;
		
		return false;
	});
	
	// Слайдер на главной
	$("#slider-idx ul").carouFredSel({
		auto 			: {pauseDuration: 5000}, 
   	pagination  : "#s-pagination"
	});
	
	// имитация radiobutton
	$(".group-radio label").click(function(){
		$(this).addClass('checked').parent().siblings('li').find('label').removeClass('checked');
	});
	
	// карусель
	// элементов в карусели
	var jsElNum = $('.mm-carousel li').length;
	// ширина елемента
	var jsElWidth = $('.mm-carousel li').width();
	// зададим ширину карусели
	$('.mm-carousel ul').css({'width':jsElNum*jsElWidth})
	// инициализация jScrollPane для карусели
	$('.mm-carousel').jScrollPane({showArrows: true, horizontalDragMaxWidth: 202, horizontalDragMinWidth: 202, animateScroll: true, arrowButtonSpeed: 158});
	
	// Бренды
	$('.brands-list a img').hover(function(){
		var newImg = $(this).attr('rel');
		var oldImg = $(this).attr('src');
		$(this).attr('src', newImg);
		$(this).attr('rel', oldImg);
	}, function(){
		var newImg = $(this).attr('rel');
		var oldImg = $(this).attr('src');
		$(this).attr('src', newImg);
		$(this).attr('rel', oldImg);
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
	
	// Клик по табам фото и видео
	$(".photovideo-tabs li a").click(function(){
		var thisHref = $(this).attr("href");
		
		$(this).parent().addClass("active").siblings("li").removeClass("active");
		$(thisHref).show().siblings("ul").hide();
		
		return false;
	});
	
	// Отзывы
	$(".reviews-list dt").click(function(){
		$(this).next("dd").slideToggle().siblings("dd").slideUp();
		
		return false;
	});
 });