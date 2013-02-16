// A.V.Plotnikov, verstalo.com

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