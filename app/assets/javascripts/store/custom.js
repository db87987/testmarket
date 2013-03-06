$(document).ready(function(){
	
	// Аккордеон левого меню каталога
	$("#catalogue-menu > ul > li > a").click(function(){
		$(this).toggleClass("active").siblings("ul").slideToggle().
		parent().siblings("li").find("a:first").removeClass("active").siblings("ul").slideUp();
		;
		
		return false;
	});
	
	// Клик по табам с описаниями в карточке товара
	$(".ce-tabs ul li a").click(function(){
		var thisHref = $(this).attr("href");
		
		$(this).parent().addClass("active").siblings("li").removeClass("active");
		$(thisHref).show().siblings("div").hide();
		
		return false;
	});
	
	// Первый шаг оформления заказа
	$("#ch-choice-1-step input").change(function(){
		var formLink = $(this).attr("data-link");
		
		$(formLink).show().siblings("form").hide();
		
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
	
	// submit form with link
	$("#sbtn").click(function(){
		$(this).closest('form').submit()
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
	
	
	// Закрыть фильтр
	$(".cg-close").click(function(){
		$(this).parent().hide();
		
		return false;
	});
	
	// Открыть фильтр
	$(".cf-goods-link").click(function(){
		$(".cf-goods").show();
		
		return false;
	});
	
	// Выбрать все в фильтре
	$(".chack-all").click(function(){
		$(this).parents(".cg-points").find("input[type='checkbox']").prop('checked', true);
		
		return false;
	});
	
	// Снять выделение всех в фильтре
	$(".de-chack-all").click(function(){
		$(this).parents(".cg-points").find("input[type='checkbox']").prop('checked', false);
		
		return false;
	});
	
	// Клик по табам в фильтре
	$(".cg-tabs li a").click(function(){
		var thisHref = $(this).attr("href");
		
		$(this).addClass("active").parent().siblings("li").find("a").removeClass("active");
		$(thisHref).show().siblings(".cg-points").hide();
		
		return false;
	});
	
	
 });