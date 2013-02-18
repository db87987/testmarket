// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require_self
//= require store/spree_core
//= require store/spree_auth
//= require store/spree_promo
//= require store/spree_essential_menus
//= require_tree .
//= require store/jquery.carouFredSel-6.1.0-packed
//= require store/jquery.mousewheel-3.0.6.pack


$(document).ready(function(){
	
	$("#catalogue-menu > ul > li > a").click(function(){
		$(this).toggleClass("active").siblings("ul").slideToggle().
		parent().siblings("li").find("a:first").removeClass("active").siblings("ul").slideUp();
		;
		
		return false;
	});
	
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
	


	
 });

