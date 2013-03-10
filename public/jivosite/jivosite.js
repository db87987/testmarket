
/*
	Коллбек-функция, вызывается сразу после того, как
	JivoSite окончательно загрузился
*/
function jivo_onLoadCallback(){
	// Создаем элемент DIV для ярлыка
	window.jivo_cstm_widget = document.createElement('div');
	jivo_cstm_widget.setAttribute('id', 'jivo_custom_widget');
	document.body.appendChild(jivo_cstm_widget);
	
	// Добавляем обработчик клика по ярлыку - чтобы при клике разворачивалось окно
	jivo_cstm_widget.onclick = function(){
		jivo_api.open();
	}
	
	// Изменяем CSS класс, если есть операторы в онлайне
	if (jivo_config.chat_mode == "online"){
		jivo_cstm_widget.setAttribute("class", "jivo_online");
	}
	
	// Теперь можно показать ярлык пользователю
	window.jivo_cstm_widget.style.display='block';
}

/*
	Коллбек-функции jivo_onOpen и jivo_onClose вызываеются всегда,
	когда окно чата JivoSite разворачивается или сворвачивается
	пользователем, либо по правилу активного приглашения.
*/
function jivo_onOpen(){
	// Если чат развернут - скрываем ярлык
	if (jivo_cstm_widget)
		jivo_cstm_widget.style.display = 'none';
}
function jivo_onClose(){
	// Если чат свернут - показываем ярлык
	if (jivo_cstm_widget)
		jivo_cstm_widget.style.display = 'block';
}