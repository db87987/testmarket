// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs

//= require store/spree_core
//= require store/spree_auth
//= require store/spree_promo

//= require_tree .

//= require store/jquery.carouFredSel-6.1.0-packed
//= require store/spree_promo

//= require store/spree_essential_menus
//= require_self

// A.V.Plotnikov, verstalo.com

$(document).ready(function()
{
	$("#slider-idx ul").carouFredSel({
		auto 			: {pauseDuration: 5000}, 
   	pagination  : "#s-pagination"
	});
});

$(document).ready(function(){
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
	
 });

