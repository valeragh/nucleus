Category.delete_all
PodCategory.delete_all
Product.delete_all
#Review.delete_all
#Contact.delete_all
#Faq.delete_all
#Post.delete_all

#1 Для вывода маток
category_1 = Category.create( title:'Для вывода маток',
										          rang:'1',
										          image_url: Rails.root.join("app/assets/images/data/IMG_7724.jpg").open)
pod_category = category_1.pod_categories.create(title: 'Клеточки',
	                                                rang: '1',
											                            image_url: Rails.root.join("app/assets/images/data/IMG_7686.jpg").open)
pod_category = category_1.pod_categories.create(title: 'Колпачки',
	                                                rang: '1',
											                            image_url: Rails.root.join("app/assets/images/data/IMG_7698.jpg").open)
pod_category = category_1.pod_categories.create(title: 'Мечение маток',
	                                                rang: '1',
											                            image_url: Rails.root.join("app/assets/images/data/IMG_7665.jpg").open)
pod_category = category_1.pod_categories.create(title: 'Шпатели и мисочки',
	                                                rang: '1',
											                            image_url: Rails.root.join("app/assets/images/data/IMG_7721.jpg").open)

#2 Воскотопки
category_2 = Category.create( title:'Воскотопки',
										          rang:'2',
										          image_url: Rails.root.join("app/assets/images/data/IMG_8040.jpg").open)
pod_category = category_2.pod_categories.create(title: 'Паровые',
	                                                rang: '1',
											                            image_url: Rails.root.join("app/assets/images/data/IMG_8038.jpg").open)
pod_category = category_2.pod_categories.create(title: 'Солнечные',
	                                                rang: '1',
											                            image_url: Rails.root.join("app/assets/images/data/IMG_8040.jpg").open)

#3 Для работы с медом
category_3 = Category.create( title:'Для работы с медом',
										          rang:'3',
										          image_url: Rails.root.join("app/assets/images/data/IMG_7760.jpg").open)
pod_category = category_3.pod_categories.create(title: 'Другое',
	                                                rang: '1',
											                            image_url: Rails.root.join("app/assets/images/data/IMG_7761.jpg").open)

#4 Дополнительный инвентарь
category_4 = Category.create( title:'Дополнительный инвентарь',
										          rang:'4',
										          image_url: Rails.root.join("app/assets/images/data/IMG_7604.jpg").open)
pod_category = category_4.pod_categories.create(title: 'Скребки',
	                                                rang: '1',
											                            image_url: Rails.root.join("app/assets/images/data/IMG_7622.jpg").open)
pod_category = category_4.pod_categories.create(title: 'Щетки',
	                                                rang: '1',
											                            image_url: Rails.root.join("app/assets/images/data/IMG_7624.jpg").open)
pod_category = category_4.pod_categories.create(title: 'Стамески',
	                                                rang: '1',
											                            image_url: Rails.root.join("app/assets/images/data/IMG_7633.jpg").open)

#5 Дымари
category_5 = Category.create( title:'Дымари',
										          rang:'5',
										          image_url: Rails.root.join("app/assets/images/data/IMG_7629.jpg").open)
pod_category = category_5.pod_categories.create(title: 'Нержавейка',
	                                                rang: '1',
											                            image_url: Rails.root.join("app/assets/images/data/IMG_7631.jpg").open)

#6 Инвентарь для распечатки соторамок
category_6 = Category.create( title:'Инвентарь для распечатки соторамок',
										          rang:'6',
										          image_url: Rails.root.join("app/assets/images/data/IMG_7604.jpg").open)
pod_category = category_6.pod_categories.create(title: 'Ножи',
	                                                rang: '1',
											                            image_url: Rails.root.join("app/assets/images/data/IMG_7622.jpg").open)
pod_category = category_6.pod_categories.create(title: 'Вилки',
	                                                rang: '1',
											                            image_url: Rails.root.join("app/assets/images/data/IMG_7624.jpg").open)

#7 Инвентарь для ульев
category_7 = Category.create( title:'Инвентарь для ульев',
										          rang:'7',
										          image_url: Rails.root.join("app/assets/images/data/IMG_7794.jpg").open)
pod_category = category_7.pod_categories.create(title: 'Цифры и другой инвентарь',
	                                                rang: '1',
											                            image_url: Rails.root.join("app/assets/images/data/IMG_7794.jpg").open)

#8 Комплектующие для ульев
category_8 = Category.create( title:'Комплектующие для ульев',
										          rang:'8',
										          image_url: Rails.root.join("app/assets/images/data/IMG_7714.jpg").open)
pod_category = category_8.pod_categories.create(title: 'Ручки ульевые',
	                                                rang: '1',
											                            image_url: Rails.root.join("app/assets/images/data/IMG_7712.jpg").open)
pod_category = category_8.pod_categories.create(title: 'Цифры и другой инвентарь',
	                                                rang: '1',
											                            image_url: Rails.root.join("app/assets/images/data/IMG_7792.jpg").open)
pod_category = category_8.pod_categories.create(title: 'Утеплители и холстики',
	                                                rang: '1',
											                            image_url: Rails.root.join("app/assets/images/data/IMG_7788.jpg").open)
pod_category = category_8.pod_categories.create(title: 'Разделительные решетки',
	                                                rang: '1',
											                            image_url: Rails.root.join("app/assets/images/data/IMG_7791.jpg").open)
pod_category = category_8.pod_categories.create(title: 'Кормушки (поилки)',
	                                                rang: '1',
											                            image_url: Rails.root.join("app/assets/images/data/IMG_7849.jpg").open)
pod_category = category_8.pod_categories.create(title: 'Пыльцесборники',
	                                                rang: '1',
											                            image_url: Rails.root.join("app/assets/images/data/IMG_8088.jpg").open)

#9 Комплектующие к медогонкам
category_9 = Category.create( title:'Комплектующие к медогонкам',
										          rang:'9',
										          image_url: Rails.root.join("app/assets/images/data/IMG_7717.jpg").open)
pod_category = category_9.pod_categories.create(title: 'Крышки, ноги и другое',
	                                                rang: '1',
											                            image_url: Rails.root.join("app/assets/images/data/IMG_7717.jpg").open)

#10 Комплектующие к ульям
category_10 = Category.create( title:'Комплектующие к ульям',
										          rang:'10',
										          image_url: Rails.root.join("app/assets/images/data/IMG_7684.jpg").open)
pod_category = category_10.pod_categories.create(title: 'Летковые заградители',
	                                                rang: '1',
											                            image_url: Rails.root.join("app/assets/images/data/IMG_7707.jpg").open)

#11 Лечение и профилактика болезней пчёл
category_11 = Category.create( title:'Лечение и профилактика болезней пчёл',
										          rang:'11',
										          image_url: Rails.root.join("app/assets/images/data/IMG_7797.jpg").open)
pod_category = category_11.pod_categories.create(title: 'Инвентарь для лечение пчел',
	                                                rang: '1',
											                            image_url: Rails.root.join("app/assets/images/data/IMG_7798.jpg").open)
pod_category = category_11.pod_categories.create(title: 'Вет-препараты',
	                                                rang: '1',
											                            image_url: Rails.root.join("app/assets/images/data/IMG_7738.jpg").open)

#12 Одежда пчеловода
category_12 = Category.create( title:'Одежда пчеловода',
										          rang:'12',
										          image_url: Rails.root.join("app/assets/images/data/IMG_7871.jpg").open)
pod_category = category_12.pod_categories.create(title: 'Шапки, перчатки и другое',
	                                                rang: '1',
											                            image_url: Rails.root.join("app/assets/images/data/IMG_7872.jpg").open)
pod_category = category_12.pod_categories.create(title: 'Комбинезоны и костюмы',
	                                                rang: '1',
											                            image_url: Rails.root.join("app/assets/images/data/IMG_7879.jpg").open)
pod_category = category_12.pod_categories.create(title: 'Штаны и куртки',
	                                                rang: '1',
											                            image_url: Rails.root.join("app/assets/images/data/IMG_7890.jpg").open)

#13 Рамка, инструменты для наващивания
category_13 = Category.create( title:'Рамка, инструменты для наващивания',
										          rang:'13',
										          image_url: Rails.root.join("app/assets/images/data/IMG_7714.jpg").open)
pod_category = category_13.pod_categories.create(title: 'Инвентарь',
	                                                rang: '1',
											                            image_url: Rails.root.join("app/assets/images/data/IMG_7716.jpg").open)
pod_category = category_13.pod_categories.create(title: 'Приспособления для натягивания проволоки',
	                                                rang: '1',
											                            image_url: Rails.root.join("app/assets/images/data/IMG_7639.jpg").open)
pod_category = category_13.pod_categories.create(title: 'Проволока и гвозди',
	                                                rang: '1',
											                            image_url: Rails.root.join("app/assets/images/data/IMG_7723.jpg").open)
pod_category = category_13.pod_categories.create(title: 'Рамка ульевая',
	                                                rang: '1',
											                            image_url: Rails.root.join("app/assets/images/data/IMG_7782.jpg").open)

#14 Ульи
category_14 = Category.create( title:'Ульи',
										          rang:'14',
										          image_url: Rails.root.join("app/assets/images/data/IMG_8020.jpg").open)
pod_category = category_14.pod_categories.create(title: 'Дадан',
	                                                rang: '1',
											                            image_url: Rails.root.join("app/assets/images/data/IMG_8023.jpg").open)
pod_category = category_14.pod_categories.create(title: 'Рута',
	                                                rang: '1',
											                            image_url: Rails.root.join("app/assets/images/data/IMG_8025.jpg").open)
pod_category = category_14.pod_categories.create(title: 'Лежак',
	                                                rang: '1',
											                            image_url: Rails.root.join("app/assets/images/data/IMG_8030.jpg").open)