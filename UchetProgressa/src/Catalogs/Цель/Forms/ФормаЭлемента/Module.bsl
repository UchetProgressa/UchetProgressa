

	&НаКлиенте
	Процедура ПриОткрытии(Отказ)
	УстановкаОтбораВТЧПрогресс();

	ПередЗаписьюНаСервере() ;
	КонецПроцедуры

	&НаСервере
	Процедура ПередЗаписьюНаСервере()
		//Вставить содержимое обработчика
		 	//{{КОНСТРУКТОР_ЗАПРОСА_С_ОБРАБОТКОЙ_РЕЗУЛЬТАТА
		// Данный фрагмент построен конструктором.
		// При повторном использовании конструктора, внесенные вручную изменения будут утеряны!!!
	    Если Объект.Ссылка  <> Справочники.Цель.ПустаяСсылка() Тогда
		
		Запрос = Новый Запрос;
		Запрос.Текст = 
			"ВЫБРАТЬ
			|	ПрогрессСрезПоследних.Название КАК Название,
			|	ПрогрессСрезПоследних.Путь КАК Путь
			|ИЗ
			|	РегистрСведений.Прогресс.СрезПоследних КАК ПрогрессСрезПоследних
			|ГДЕ
			|	ПрогрессСрезПоследних.Цель = &Цель";
		
		Запрос.УстановитьПараметр("Цель", Объект.Ссылка);
		
		РезультатЗапроса = Запрос.Выполнить();
		
		//ВыборкаДетальныеЗаписи = РезультатЗапроса.Выбрать();
		Если РезультатЗапроса.Пустой() =  Ложь     Тогда
		
	    Объект.Название = РезультатЗапроса.Выгрузить()[0].Название ; 
		Объект.Путь =  РезультатЗапроса.Выгрузить()[0].Путь ;
		КонецЕсли
		
		КонецЕсли

		
	КонецПроцедуры

	&НаКлиенте
	Процедура ПередЗаписью(Отказ, ПараметрыЗаписи)
		ПередЗаписьюНаСервере();
	КонецПроцедуры

	&НаКлиенте
	Процедура ПутьОткрытие(Элемент, СтандартнаяОбработка)
		// Вставить содержимое обработчика.
		СтандартнаяОбработка =Ложь ;
		ЗапуститьПриложение(Объект.Путь );
	КонецПроцедуры

	&НаКлиенте
	Процедура ОстановилсяНаОткрытие(Элемент, СтандартнаяОбработка)
		// Вставить содержимое обработчика.
		СтандартнаяОбработка =Ложь ;
		ЗапуститьПриложение(Объект.Путь+Объект.Название);	
	КонецПроцедуры

&НаКлиенте
	Процедура ПослеЗаписи(ПараметрыЗаписи)
		//Вставить содержимое обработчика
		УстановкаОтбораВТЧПрогресс()  ;
	КонецПроцедуры

&НаКлиенте
Процедура УстановкаОтбораВТЧПрогресс()  ;
	ЭлементОтбора = Прогресс.Отбор.Элементы.Добавить(Тип("ЭлементОтбораКомпоновкиДанных"));
	ЭлементОтбора.ЛевоеЗначение = Новый ПолеКомпоновкиДанных("Цель");
	ЭлементОтбора.ВидСравнения = ВидСравненияКомпоновкиДанных.Равно;
	ЭлементОтбора.Использование = Истина;
	ЭлементОтбора.ПравоеЗначение = Объект.Ссылка;

	
КонецПроцедуры


&НаКлиенте
Процедура ДополнительнаяИнформацияЗначениеОткрытие(Элемент, СтандартнаяОбработка)
	// Вставить содержимое обработчика.
	СтандартнаяОбработка = Ложь;
	ЗапуститьПриложение(Элемент.ТекстРедактирования);

КонецПроцедуры

