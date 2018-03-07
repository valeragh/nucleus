Category.delete_all
PodCategory.delete_all
category_1 = Category.create( title:'Для вывода маток',
										            rang:'1',
										            image_url: Rails.root.join("app/assets/images/test_product.jpg").open)
pod_category_1 = category_1.pod_categories.create(title: 'Для вывода маток',
	                                                    rang: '1',
											                                image_url: Rails.root.join("app/assets/images/test_product.jpg").open)

category_2 = Category.create( title:'Дым-пушка ВАРОА-МОР',
									            rang:'2',
									            image_url: Rails.root.join("app/assets/images/test_product.jpg").open)
pod_category_1 = category_2.pod_categories.create(title: 'Дым-пушка ВАРОА-МОР',
                                                  rang: '1',
									                                image_url: Rails.root.join("app/assets/images/test_product.jpg").open)

category_3 = Category.create( title:'Дымари',
									            rang:'3',
									            image_url: Rails.root.join("app/assets/images/test_product.jpg").open)
pod_category_1 = category_3.pod_categories.create(title: 'Дымари',
                                                  rang: '1',
									                                image_url: Rails.root.join("app/assets/images/test_product.jpg").open)
            
category_4 = Category.create( title:'Инвентарь для распечатки соторамок',
									            rang:'4',
									            image_url: Rails.root.join("app/assets/images/test_product.jpg").open)
pod_category_1 = category_4.pod_categories.create(title: 'Инвентарь для распечатки соторамок',
                                                  rang: '1',
									                                image_url: Rails.root.join("app/assets/images/test_product.jpg").open)

category_5 = Category.create( title:'Инвентарь пчеловода',
									            rang:'5',
									            image_url: Rails.root.join("app/assets/images/test_product.jpg").open)
pod_category_1 = category_5.pod_categories.create(title: 'Инвентарь пчеловода',
                                                  rang: '1',
									                                image_url: Rails.root.join("app/assets/images/test_product.jpg").open)
pod_category_2 = category_5.pod_categories.create(title: 'Щетки пасечные',
                                                  rang: '1',
									                                image_url: Rails.root.join("app/assets/images/test_product.jpg").open)
pod_category_3 = category_5.pod_categories.create(title: 'Стамески пасечные',
                                                  rang: '1',
									                                image_url: Rails.root.join("app/assets/images/test_product.jpg").open)

category_6 = Category.create( title:'Комплектующее для ульев',
									            rang:'6',
									            image_url: Rails.root.join("app/assets/images/test_product.jpg").open)
pod_category_1 = category_6.pod_categories.create(title: 'Летковые заградители',
                                                  rang: '1',
									                                image_url: Rails.root.join("app/assets/images/test_product.jpg").open)

category_7 = Category.create( title:'Лечение пчел',
									            rang:'7',
									            image_url: Rails.root.join("app/assets/images/test_product.jpg").open)
pod_category_1 = category_7.pod_categories.create(title: 'Дымовая пушка ВАРОА-МОР',
                                                  rang: '1',
									                                image_url: Rails.root.join("app/assets/images/test_product.jpg").open)

category_8 = Category.create( title:'Медогонки',
									            rang:'8',
									            image_url: Rails.root.join("app/assets/images/test_product.jpg").open)
pod_category_1 = category_8.pod_categories.create(title: 'Комплектующее для медогонок',
                                                  rang: '1',
									                                image_url: Rails.root.join("app/assets/images/test_product.jpg").open)

category_9 = Category.create( title:'Одежда пчеловода',
									            rang:'9',
									            image_url: Rails.root.join("app/assets/images/test_product.jpg").open)
pod_category_1 = category_9.pod_categories.create(title: 'Одежда пчеловода',
                                                  rang: '1',
									                                image_url: Rails.root.join("app/assets/images/test_product.jpg").open)

category_10 = Category.create( title:'Препараты для пчел',
									            rang:'10',
									            image_url: Rails.root.join("app/assets/images/test_product.jpg").open)
pod_category_1 = category_10.pod_categories.create(title: 'От клеща (Варроатоза)',
                                                  rang: '1',
									                                image_url: Rails.root.join("app/assets/images/test_product.jpg").open)
pod_category_2 = category_10.pod_categories.create(title: 'Для проверки меда',
                                                  rang: '1',
									                                image_url: Rails.root.join("app/assets/images/test_product.jpg").open)
pod_category_3 = category_10.pod_categories.create(title: 'От грибковых болезней',
                                                  rang: '1',
									                                image_url: Rails.root.join("app/assets/images/test_product.jpg").open)
pod_category_4 = category_10.pod_categories.create(title: 'От гнильцовых болезней',
                                                  rang: '1',
									                                image_url: Rails.root.join("app/assets/images/test_product.jpg").open)

category_11 = Category.create( title:'Ульи',
									            rang:'11',
									            image_url: Rails.root.join("app/assets/images/test_product.jpg").open)
pod_category_1 = category_11.pod_categories.create(title: 'Комплектующее для ульев',
                                                  rang: '1',
									                                image_url: Rails.root.join("app/assets/images/test_product.jpg").open)
pod_category_2 = category_11.pod_categories.create(title: 'Рамки для ульев',
                                                  rang: '1',
									                                image_url: Rails.root.join("app/assets/images/test_product.jpg").open)
pod_category_3 = category_11.pod_categories.create(title: 'Кормушки и пыльцесборники',
                                                  rang: '1',
									                                image_url: Rails.root.join("app/assets/images/test_product.jpg").open)
pod_category_4 = category_11.pod_categories.create(title: 'Утеплители и холстики',
                                                  rang: '1',
									                                image_url: Rails.root.join("app/assets/images/test_product.jpg").open)
pod_category_5 = category_11.pod_categories.create(title: 'Разделительные решетки',
                                                  rang: '1',
									                                image_url: Rails.root.join("app/assets/images/test_product.jpg").open)
pod_category_6 = category_11.pod_categories.create(title: 'Ульи',
                                                  rang: '1',
									                                image_url: Rails.root.join("app/assets/images/test_product.jpg").open)
