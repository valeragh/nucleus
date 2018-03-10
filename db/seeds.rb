Category.delete_all
PodCategory.delete_all
Product.delete_all
Review.delete_all
Contact.delete_all

Contact.create(title:'Луганская область',
	           description: 'Магазин находится рядом с рынком. В наличие вся продукция',
	           address: 'улица Шевченко 33, Старобельск',
	           phone_one: '050-555-55-55',
	           phone_two: '067-555-55-55',
	           image_url: Rails.root.join("app/assets/images/magazine_nucleus.jpg").open,
	           longitude: '38.9074943',
	           latitude: '49.278819',
	           status: 'Показать')
Contact.create(title:'Харьковская область',
	           description: 'Магазин находится рядом с рынком. В наличие вся продукция',
	           address: 'вулиця Пушкінська, 37, Харків',
	           phone_one: '050-555-55-55',
	           phone_two: '067-555-55-55',
	           image_url: Rails.root.join("app/assets/images/magazine_nucleus.jpg").open,
	           longitude: '36.239841',
	           latitude: '49.9978735',
	           status: 'Показать')

category_1 = Category.create( title:'Для вывода маток',
										            rang:'1',
										            image_url: Rails.root.join("app/assets/images/test_product.jpg").open)
pod_category_1 = category_1.pod_categories.create(title: 'Для вывода маток',
	                                                    rang: '1',
											                                image_url: Rails.root.join("app/assets/images/test_product.jpg").open)
product = pod_category_1.products.create( title:'Колпачок квадратный 90мм',
									              rang:'1',
									              status: 'В наличие',
									              price: '10000,45',
									              description: 'При помощи такого колпачка, вы с легкостью сможете изолировать матку, находящуюся на соте, не затрачивая на это много времени, самое главное, подобный способ временной изоляции наиболее безопасный для самой матки. Колпачки для изоляции используются пасечниками с разными целями, временной изоляции матки во время проведения работ в улье, или изоляции матки в процессе ее мечения.',
									              image_url: Rails.root.join("app/assets/images/test_product.jpg").open,
									              category_id: category_1.id
	                            )
product.reviews.create(name: 'Иванов Иван',
	                     status: 'Показать',
	                     description: 'Пришла моя посылочка. Очень оперативно. Спасибо. Костюм просто супер, качество хорошее!',
	                     )
pod_category_1.products.create( title:'Клеточка маточная металическая (Титова)',
									              rang:'2',
									              status: 'Под заказ',
									              price: '105,35',
									              description: 'Клеточка позволяет пасечникам исключить возможность контакта матки с пчелами. Позволяя матке спокойно пропитаться запахом улья и дать остальным пчелам привыкнуть к себе. Все стенки клеточки имеют отверстия, благодаря им, матка находится в непосредственной близости от пчел, что ускоряет процесс их привыкания к матке и увеличивает шансы на ее успешное принятие в семью. Эта модель изоляционной клеточки, очень популярна среди многих пасечников по всему миру, проста в использовании и надежна.',
									              image_url: Rails.root.join("app/assets/images/test_product.jpg").open,
									              category_id: category_1.id
	                            )
pod_category_1.products.create( title:'Каток для распечатывания сот «Ежик» деревянная ручка',
									              rang:'3',
									              status: 'Скрыть',
									              price: '1000,35',
									              description: 'Удобный инструмент, с помощью которого можно правильно распечатать пчелиные соты, перед откачкой меда. Принцип использования катка подразумевает под собой неглубокое прокалывание и распечатывание крышечек из воска.',
									              image_url: Rails.root.join("app/assets/images/test_product.jpg").open,
									              category_id: category_1.id
	                            )

category_2 = Category.create( title:'Дым-пушка ВАРОА-МОР',
									            rang:'2',
									            image_url: Rails.root.join("app/assets/images/test_product.jpg").open)
pod_category_1 = category_2.pod_categories.create(title: 'Дым-пушка ВАРОА-МОР',
                                                  rang: '1',
									                                image_url: Rails.root.join("app/assets/images/test_product.jpg").open)
product = pod_category_1.products.create( title:'Колпачок квадратный 90мм',
									              rang:'1',
									              status: 'В наличие',
									              price: '10000,45',
									              description: 'При помощи такого колпачка, вы с легкостью сможете изолировать матку, находящуюся на соте, не затрачивая на это много времени, самое главное, подобный способ временной изоляции наиболее безопасный для самой матки. Колпачки для изоляции используются пасечниками с разными целями, временной изоляции матки во время проведения работ в улье, или изоляции матки в процессе ее мечения.',
									              image_url: Rails.root.join("app/assets/images/test_product.jpg").open,
									              category_id: category_2.id
	                            )
product.reviews.create(name: 'Иванов Иван',
	                     status: 'Показать',
	                     description: 'Пришла моя посылочка. Очень оперативно. Спасибо. Костюм просто супер, качество хорошее!',
	                     )
pod_category_1.products.create( title:'Клеточка маточная металическая (Титова)',
									              rang:'2',
									              status: 'Под заказ',
									              price: '105,35',
									              description: 'Клеточка позволяет пасечникам исключить возможность контакта матки с пчелами. Позволяя матке спокойно пропитаться запахом улья и дать остальным пчелам привыкнуть к себе. Все стенки клеточки имеют отверстия, благодаря им, матка находится в непосредственной близости от пчел, что ускоряет процесс их привыкания к матке и увеличивает шансы на ее успешное принятие в семью. Эта модель изоляционной клеточки, очень популярна среди многих пасечников по всему миру, проста в использовании и надежна.',
									              image_url: Rails.root.join("app/assets/images/test_product.jpg").open,
									              category_id: category_2.id
	                            )
pod_category_1.products.create( title:'Каток для распечатывания сот «Ежик» деревянная ручка',
									              rang:'3',
									              status: 'Скрыть',
									              price: '1000,35',
									              description: 'Удобный инструмент, с помощью которого можно правильно распечатать пчелиные соты, перед откачкой меда. Принцип использования катка подразумевает под собой неглубокое прокалывание и распечатывание крышечек из воска.',
									              image_url: Rails.root.join("app/assets/images/test_product.jpg").open,
									              category_id: category_2.id
	                            )

category_3 = Category.create( title:'Дымари',
									            rang:'3',
									            image_url: Rails.root.join("app/assets/images/test_product.jpg").open)
pod_category_1 = category_3.pod_categories.create(title: 'Дымари',
                                                  rang: '1',
									                                image_url: Rails.root.join("app/assets/images/test_product.jpg").open)
pod_category_1.products.create( title:'Колпачок квадратный 90мм',
									              rang:'1',
									              status: 'В наличие',
									              price: '10000,45',
									              description: 'При помощи такого колпачка, вы с легкостью сможете изолировать матку, находящуюся на соте, не затрачивая на это много времени, самое главное, подобный способ временной изоляции наиболее безопасный для самой матки. Колпачки для изоляции используются пасечниками с разными целями, временной изоляции матки во время проведения работ в улье, или изоляции матки в процессе ее мечения.',
									              image_url: Rails.root.join("app/assets/images/test_product.jpg").open,
									              category_id: category_3.id
	                            )
pod_category_1.products.create( title:'Клеточка маточная металическая (Титова)',
									              rang:'2',
									              status: 'Под заказ',
									              price: '105,35',
									              description: 'Клеточка позволяет пасечникам исключить возможность контакта матки с пчелами. Позволяя матке спокойно пропитаться запахом улья и дать остальным пчелам привыкнуть к себе. Все стенки клеточки имеют отверстия, благодаря им, матка находится в непосредственной близости от пчел, что ускоряет процесс их привыкания к матке и увеличивает шансы на ее успешное принятие в семью. Эта модель изоляционной клеточки, очень популярна среди многих пасечников по всему миру, проста в использовании и надежна.',
									              image_url: Rails.root.join("app/assets/images/test_product.jpg").open,
									              category_id: category_3.id
	                            )
product = pod_category_1.products.create( title:'Каток для распечатывания сот «Ежик» деревянная ручка',
									              rang:'3',
									              status: 'Скрыть',
									              price: '1000,35',
									              description: 'Удобный инструмент, с помощью которого можно правильно распечатать пчелиные соты, перед откачкой меда. Принцип использования катка подразумевает под собой неглубокое прокалывание и распечатывание крышечек из воска.',
									              image_url: Rails.root.join("app/assets/images/test_product.jpg").open,
									              category_id: category_3.id
	                            )
product.reviews.create(name: 'Иванов Иван',
	                     status: 'Показать',
	                     description: 'Пришла моя посылочка. Очень оперативно. Спасибо. Костюм просто супер, качество хорошее!',
	                     )            
category_4 = Category.create( title:'Инвентарь для распечатки соторамок',
									            rang:'4',
									            image_url: Rails.root.join("app/assets/images/test_product.jpg").open)
pod_category_1.products.create( title:'Колпачок квадратный 90мм',
									              rang:'1',
									              status: 'В наличие',
									              price: '10000,45',
									              description: 'При помощи такого колпачка, вы с легкостью сможете изолировать матку, находящуюся на соте, не затрачивая на это много времени, самое главное, подобный способ временной изоляции наиболее безопасный для самой матки. Колпачки для изоляции используются пасечниками с разными целями, временной изоляции матки во время проведения работ в улье, или изоляции матки в процессе ее мечения.',
									              image_url: Rails.root.join("app/assets/images/test_product.jpg").open,
									              category_id: category_4.id
	                            )
pod_category_1.products.create( title:'Клеточка маточная металическая (Титова)',
									              rang:'2',
									              status: 'Под заказ',
									              price: '105,35',
									              description: 'Клеточка позволяет пасечникам исключить возможность контакта матки с пчелами. Позволяя матке спокойно пропитаться запахом улья и дать остальным пчелам привыкнуть к себе. Все стенки клеточки имеют отверстия, благодаря им, матка находится в непосредственной близости от пчел, что ускоряет процесс их привыкания к матке и увеличивает шансы на ее успешное принятие в семью. Эта модель изоляционной клеточки, очень популярна среди многих пасечников по всему миру, проста в использовании и надежна.',
									              image_url: Rails.root.join("app/assets/images/test_product.jpg").open,
									              category_id: category_4.id
	                            )
pod_category_1.products.create( title:'Каток для распечатывания сот «Ежик» деревянная ручка',
									              rang:'3',
									              status: 'Скрыть',
									              price: '1000,35',
									              description: 'Удобный инструмент, с помощью которого можно правильно распечатать пчелиные соты, перед откачкой меда. Принцип использования катка подразумевает под собой неглубокое прокалывание и распечатывание крышечек из воска.',
									              image_url: Rails.root.join("app/assets/images/test_product.jpg").open,
									              category_id: category_4.id
	                            )
pod_category_1 = category_4.pod_categories.create(title: 'Инвентарь для распечатки соторамок',
                                                  rang: '1',
									                                image_url: Rails.root.join("app/assets/images/test_product.jpg").open)

category_5 = Category.create( title:'Инвентарь пчеловода',
									            rang:'5',
									            image_url: Rails.root.join("app/assets/images/test_product.jpg").open)
pod_category_1 = category_5.pod_categories.create(title: 'Инвентарь пчеловода',
                                                  rang: '1',
									                                image_url: Rails.root.join("app/assets/images/test_product.jpg").open)
pod_category_1.products.create( title:'Колпачок квадратный 90мм',
									              rang:'1',
									              status: 'В наличие',
									              price: '10000,45',
									              description: 'При помощи такого колпачка, вы с легкостью сможете изолировать матку, находящуюся на соте, не затрачивая на это много времени, самое главное, подобный способ временной изоляции наиболее безопасный для самой матки. Колпачки для изоляции используются пасечниками с разными целями, временной изоляции матки во время проведения работ в улье, или изоляции матки в процессе ее мечения.',
									              image_url: Rails.root.join("app/assets/images/test_product.jpg").open,
									              category_id: category_5.id
	                            )
pod_category_1.products.create( title:'Клеточка маточная металическая (Титова)',
									              rang:'2',
									              status: 'Под заказ',
									              price: '105,35',
									              description: 'Клеточка позволяет пасечникам исключить возможность контакта матки с пчелами. Позволяя матке спокойно пропитаться запахом улья и дать остальным пчелам привыкнуть к себе. Все стенки клеточки имеют отверстия, благодаря им, матка находится в непосредственной близости от пчел, что ускоряет процесс их привыкания к матке и увеличивает шансы на ее успешное принятие в семью. Эта модель изоляционной клеточки, очень популярна среди многих пасечников по всему миру, проста в использовании и надежна.',
									              image_url: Rails.root.join("app/assets/images/test_product.jpg").open,
									              category_id: category_5.id
	                            )
pod_category_1.products.create( title:'Каток для распечатывания сот «Ежик» деревянная ручка',
									              rang:'3',
									              status: 'Скрыть',
									              price: '1000,35',
									              description: 'Удобный инструмент, с помощью которого можно правильно распечатать пчелиные соты, перед откачкой меда. Принцип использования катка подразумевает под собой неглубокое прокалывание и распечатывание крышечек из воска.',
									              image_url: Rails.root.join("app/assets/images/test_product.jpg").open,
									              category_id: category_5.id
	                            )
pod_category_2 = category_5.pod_categories.create(title: 'Щетки пасечные',
                                                  rang: '1',
									                                image_url: Rails.root.join("app/assets/images/test_product.jpg").open)
pod_category_2.products.create( title:'Колпачок квадратный 90мм',
									              rang:'1',
									              status: 'В наличие',
									              price: '10000,45',
									              description: 'При помощи такого колпачка, вы с легкостью сможете изолировать матку, находящуюся на соте, не затрачивая на это много времени, самое главное, подобный способ временной изоляции наиболее безопасный для самой матки. Колпачки для изоляции используются пасечниками с разными целями, временной изоляции матки во время проведения работ в улье, или изоляции матки в процессе ее мечения.',
									              image_url: Rails.root.join("app/assets/images/test_product.jpg").open,
									              category_id: category_5.id
	                            )
pod_category_2.products.create( title:'Клеточка маточная металическая (Титова)',
									              rang:'2',
									              status: 'Под заказ',
									              price: '105,35',
									              description: 'Клеточка позволяет пасечникам исключить возможность контакта матки с пчелами. Позволяя матке спокойно пропитаться запахом улья и дать остальным пчелам привыкнуть к себе. Все стенки клеточки имеют отверстия, благодаря им, матка находится в непосредственной близости от пчел, что ускоряет процесс их привыкания к матке и увеличивает шансы на ее успешное принятие в семью. Эта модель изоляционной клеточки, очень популярна среди многих пасечников по всему миру, проста в использовании и надежна.',
									              image_url: Rails.root.join("app/assets/images/test_product.jpg").open,
									              category_id: category_5.id
	                            )
pod_category_2.products.create( title:'Каток для распечатывания сот «Ежик» деревянная ручка',
									              rang:'3',
									              status: 'Скрыть',
									              price: '1000,35',
									              description: 'Удобный инструмент, с помощью которого можно правильно распечатать пчелиные соты, перед откачкой меда. Принцип использования катка подразумевает под собой неглубокое прокалывание и распечатывание крышечек из воска.',
									              image_url: Rails.root.join("app/assets/images/test_product.jpg").open,
									              category_id: category_5.id
	                            )
pod_category_3 = category_5.pod_categories.create(title: 'Стамески пасечные',
                                                  rang: '1',
									                                image_url: Rails.root.join("app/assets/images/test_product.jpg").open)
pod_category_3.products.create( title:'Колпачок квадратный 90мм',
									              rang:'1',
									              status: 'В наличие',
									              price: '10000,45',
									              description: 'При помощи такого колпачка, вы с легкостью сможете изолировать матку, находящуюся на соте, не затрачивая на это много времени, самое главное, подобный способ временной изоляции наиболее безопасный для самой матки. Колпачки для изоляции используются пасечниками с разными целями, временной изоляции матки во время проведения работ в улье, или изоляции матки в процессе ее мечения.',
									              image_url: Rails.root.join("app/assets/images/test_product.jpg").open,
									              category_id: category_5.id
	                            )
pod_category_3.products.create( title:'Клеточка маточная металическая (Титова)',
									              rang:'2',
									              status: 'Под заказ',
									              price: '105,35',
									              description: 'Клеточка позволяет пасечникам исключить возможность контакта матки с пчелами. Позволяя матке спокойно пропитаться запахом улья и дать остальным пчелам привыкнуть к себе. Все стенки клеточки имеют отверстия, благодаря им, матка находится в непосредственной близости от пчел, что ускоряет процесс их привыкания к матке и увеличивает шансы на ее успешное принятие в семью. Эта модель изоляционной клеточки, очень популярна среди многих пасечников по всему миру, проста в использовании и надежна.',
									              image_url: Rails.root.join("app/assets/images/test_product.jpg").open,
									              category_id: category_5.id
	                            )
pod_category_3.products.create( title:'Каток для распечатывания сот «Ежик» деревянная ручка',
									              rang:'3',
									              status: 'Скрыть',
									              price: '1000,35',
									              description: 'Удобный инструмент, с помощью которого можно правильно распечатать пчелиные соты, перед откачкой меда. Принцип использования катка подразумевает под собой неглубокое прокалывание и распечатывание крышечек из воска.',
									              image_url: Rails.root.join("app/assets/images/test_product.jpg").open,
									              category_id: category_5.id
	                            )

category_6 = Category.create( title:'Комплектующее для ульев',
									            rang:'6',
									            image_url: Rails.root.join("app/assets/images/test_product.jpg").open)
pod_category_1 = category_6.pod_categories.create(title: 'Летковые заградители',
                                                  rang: '1',
									                                image_url: Rails.root.join("app/assets/images/test_product.jpg").open)
pod_category_1.products.create( title:'Колпачок квадратный 90мм',
									              rang:'1',
									              status: 'В наличие',
									              price: '10000,45',
									              description: 'При помощи такого колпачка, вы с легкостью сможете изолировать матку, находящуюся на соте, не затрачивая на это много времени, самое главное, подобный способ временной изоляции наиболее безопасный для самой матки. Колпачки для изоляции используются пасечниками с разными целями, временной изоляции матки во время проведения работ в улье, или изоляции матки в процессе ее мечения.',
									              image_url: Rails.root.join("app/assets/images/test_product.jpg").open,
									              category_id: category_6.id
	                            )
pod_category_1.products.create( title:'Клеточка маточная металическая (Титова)',
									              rang:'2',
									              status: 'Под заказ',
									              price: '105,35',
									              description: 'Клеточка позволяет пасечникам исключить возможность контакта матки с пчелами. Позволяя матке спокойно пропитаться запахом улья и дать остальным пчелам привыкнуть к себе. Все стенки клеточки имеют отверстия, благодаря им, матка находится в непосредственной близости от пчел, что ускоряет процесс их привыкания к матке и увеличивает шансы на ее успешное принятие в семью. Эта модель изоляционной клеточки, очень популярна среди многих пасечников по всему миру, проста в использовании и надежна.',
									              image_url: Rails.root.join("app/assets/images/test_product.jpg").open,
									              category_id: category_6.id
	                            )
pod_category_1.products.create( title:'Каток для распечатывания сот «Ежик» деревянная ручка',
									              rang:'3',
									              status: 'Скрыть',
									              price: '1000,35',
									              description: 'Удобный инструмент, с помощью которого можно правильно распечатать пчелиные соты, перед откачкой меда. Принцип использования катка подразумевает под собой неглубокое прокалывание и распечатывание крышечек из воска.',
									              image_url: Rails.root.join("app/assets/images/test_product.jpg").open,
									              category_id: category_6.id
	                            )

category_7 = Category.create( title:'Лечение пчел',
									            rang:'7',
									            image_url: Rails.root.join("app/assets/images/test_product.jpg").open)
pod_category_1 = category_7.pod_categories.create(title: 'Дымовая пушка ВАРОА-МОР',
                                                  rang: '1',
									                                image_url: Rails.root.join("app/assets/images/test_product.jpg").open)
pod_category_1.products.create( title:'Колпачок квадратный 90мм',
									              rang:'1',
									              status: 'В наличие',
									              price: '10000,45',
									              description: 'При помощи такого колпачка, вы с легкостью сможете изолировать матку, находящуюся на соте, не затрачивая на это много времени, самое главное, подобный способ временной изоляции наиболее безопасный для самой матки. Колпачки для изоляции используются пасечниками с разными целями, временной изоляции матки во время проведения работ в улье, или изоляции матки в процессе ее мечения.',
									              image_url: Rails.root.join("app/assets/images/test_product.jpg").open,
									              category_id: category_7.id
	                            )
pod_category_1.products.create( title:'Клеточка маточная металическая (Титова)',
									              rang:'2',
									              status: 'Под заказ',
									              price: '105,35',
									              description: 'Клеточка позволяет пасечникам исключить возможность контакта матки с пчелами. Позволяя матке спокойно пропитаться запахом улья и дать остальным пчелам привыкнуть к себе. Все стенки клеточки имеют отверстия, благодаря им, матка находится в непосредственной близости от пчел, что ускоряет процесс их привыкания к матке и увеличивает шансы на ее успешное принятие в семью. Эта модель изоляционной клеточки, очень популярна среди многих пасечников по всему миру, проста в использовании и надежна.',
									              image_url: Rails.root.join("app/assets/images/test_product.jpg").open,
									              category_id: category_7.id
	                            )
pod_category_1.products.create( title:'Каток для распечатывания сот «Ежик» деревянная ручка',
									              rang:'3',
									              status: 'Скрыть',
									              price: '1000,35',
									              description: 'Удобный инструмент, с помощью которого можно правильно распечатать пчелиные соты, перед откачкой меда. Принцип использования катка подразумевает под собой неглубокое прокалывание и распечатывание крышечек из воска.',
									              image_url: Rails.root.join("app/assets/images/test_product.jpg").open,
									              category_id: category_7.id
	                            )

category_8 = Category.create( title:'Медогонки',
									            rang:'8',
									            image_url: Rails.root.join("app/assets/images/test_product.jpg").open)
pod_category_1 = category_8.pod_categories.create(title: 'Комплектующее для медогонок',
                                                  rang: '1',
									                                image_url: Rails.root.join("app/assets/images/test_product.jpg").open)
pod_category_1.products.create( title:'Колпачок квадратный 90мм',
									              rang:'1',
									              status: 'В наличие',
									              price: '10000,45',
									              description: 'При помощи такого колпачка, вы с легкостью сможете изолировать матку, находящуюся на соте, не затрачивая на это много времени, самое главное, подобный способ временной изоляции наиболее безопасный для самой матки. Колпачки для изоляции используются пасечниками с разными целями, временной изоляции матки во время проведения работ в улье, или изоляции матки в процессе ее мечения.',
									              image_url: Rails.root.join("app/assets/images/test_product.jpg").open,
									              category_id: category_8.id
	                            )
pod_category_1.products.create( title:'Клеточка маточная металическая (Титова)',
									              rang:'2',
									              status: 'Под заказ',
									              price: '105,35',
									              description: 'Клеточка позволяет пасечникам исключить возможность контакта матки с пчелами. Позволяя матке спокойно пропитаться запахом улья и дать остальным пчелам привыкнуть к себе. Все стенки клеточки имеют отверстия, благодаря им, матка находится в непосредственной близости от пчел, что ускоряет процесс их привыкания к матке и увеличивает шансы на ее успешное принятие в семью. Эта модель изоляционной клеточки, очень популярна среди многих пасечников по всему миру, проста в использовании и надежна.',
									              image_url: Rails.root.join("app/assets/images/test_product.jpg").open,
									              category_id: category_8.id
	                            )
pod_category_1.products.create( title:'Каток для распечатывания сот «Ежик» деревянная ручка',
									              rang:'3',
									              status: 'Скрыть',
									              price: '1000,35',
									              description: 'Удобный инструмент, с помощью которого можно правильно распечатать пчелиные соты, перед откачкой меда. Принцип использования катка подразумевает под собой неглубокое прокалывание и распечатывание крышечек из воска.',
									              image_url: Rails.root.join("app/assets/images/test_product.jpg").open,
									              category_id: category_8.id
	                            )

category_9 = Category.create( title:'Одежда пчеловода',
									            rang:'9',
									            image_url: Rails.root.join("app/assets/images/test_product.jpg").open)
pod_category_1 = category_9.pod_categories.create(title: 'Одежда пчеловода',
                                                  rang: '1',
									                                image_url: Rails.root.join("app/assets/images/test_product.jpg").open)
pod_category_1.products.create( title:'Колпачок квадратный 90мм',
									              rang:'1',
									              status: 'В наличие',
									              price: '10000,45',
									              description: 'При помощи такого колпачка, вы с легкостью сможете изолировать матку, находящуюся на соте, не затрачивая на это много времени, самое главное, подобный способ временной изоляции наиболее безопасный для самой матки. Колпачки для изоляции используются пасечниками с разными целями, временной изоляции матки во время проведения работ в улье, или изоляции матки в процессе ее мечения.',
									              image_url: Rails.root.join("app/assets/images/test_product.jpg").open,
									              category_id: category_9.id
	                            )
pod_category_1.products.create( title:'Клеточка маточная металическая (Титова)',
									              rang:'2',
									              status: 'Под заказ',
									              price: '105,35',
									              description: 'Клеточка позволяет пасечникам исключить возможность контакта матки с пчелами. Позволяя матке спокойно пропитаться запахом улья и дать остальным пчелам привыкнуть к себе. Все стенки клеточки имеют отверстия, благодаря им, матка находится в непосредственной близости от пчел, что ускоряет процесс их привыкания к матке и увеличивает шансы на ее успешное принятие в семью. Эта модель изоляционной клеточки, очень популярна среди многих пасечников по всему миру, проста в использовании и надежна.',
									              image_url: Rails.root.join("app/assets/images/test_product.jpg").open,
									              category_id: category_9.id
	                            )
pod_category_1.products.create( title:'Каток для распечатывания сот «Ежик» деревянная ручка',
									              rang:'3',
									              status: 'Скрыть',
									              price: '1000,35',
									              description: 'Удобный инструмент, с помощью которого можно правильно распечатать пчелиные соты, перед откачкой меда. Принцип использования катка подразумевает под собой неглубокое прокалывание и распечатывание крышечек из воска.',
									              image_url: Rails.root.join("app/assets/images/test_product.jpg").open,
									              category_id: category_9.id
	                            )

category_10 = Category.create( title:'Препараты для пчел',
									            rang:'10',
									            image_url: Rails.root.join("app/assets/images/test_product.jpg").open)
pod_category_1 = category_10.pod_categories.create(title: 'От клеща (Варроатоза)',
                                                  rang: '1',
									                                image_url: Rails.root.join("app/assets/images/test_product.jpg").open)
pod_category_1.products.create( title:'Колпачок квадратный 90мм',
									              rang:'1',
									              status: 'В наличие',
									              price: '10000,45',
									              description: 'При помощи такого колпачка, вы с легкостью сможете изолировать матку, находящуюся на соте, не затрачивая на это много времени, самое главное, подобный способ временной изоляции наиболее безопасный для самой матки. Колпачки для изоляции используются пасечниками с разными целями, временной изоляции матки во время проведения работ в улье, или изоляции матки в процессе ее мечения.',
									              image_url: Rails.root.join("app/assets/images/test_product.jpg").open,
									              category_id: category_10.id
	                            )
pod_category_1.products.create( title:'Клеточка маточная металическая (Титова)',
									              rang:'2',
									              status: 'Под заказ',
									              price: '105,35',
									              description: 'Клеточка позволяет пасечникам исключить возможность контакта матки с пчелами. Позволяя матке спокойно пропитаться запахом улья и дать остальным пчелам привыкнуть к себе. Все стенки клеточки имеют отверстия, благодаря им, матка находится в непосредственной близости от пчел, что ускоряет процесс их привыкания к матке и увеличивает шансы на ее успешное принятие в семью. Эта модель изоляционной клеточки, очень популярна среди многих пасечников по всему миру, проста в использовании и надежна.',
									              image_url: Rails.root.join("app/assets/images/test_product.jpg").open,
									              category_id: category_10.id
	                            )
pod_category_1.products.create( title:'Каток для распечатывания сот «Ежик» деревянная ручка',
									              rang:'3',
									              status: 'Скрыть',
									              price: '1000,35',
									              description: 'Удобный инструмент, с помощью которого можно правильно распечатать пчелиные соты, перед откачкой меда. Принцип использования катка подразумевает под собой неглубокое прокалывание и распечатывание крышечек из воска.',
									              image_url: Rails.root.join("app/assets/images/test_product.jpg").open,
									              category_id: category_10.id
	                            )
pod_category_2 = category_10.pod_categories.create(title: 'Для проверки меда',
                                                  rang: '1',
									                                image_url: Rails.root.join("app/assets/images/test_product.jpg").open)
pod_category_2.products.create( title:'Колпачок квадратный 90мм',
									              rang:'1',
									              status: 'В наличие',
									              price: '10000,45',
									              description: 'При помощи такого колпачка, вы с легкостью сможете изолировать матку, находящуюся на соте, не затрачивая на это много времени, самое главное, подобный способ временной изоляции наиболее безопасный для самой матки. Колпачки для изоляции используются пасечниками с разными целями, временной изоляции матки во время проведения работ в улье, или изоляции матки в процессе ее мечения.',
									              image_url: Rails.root.join("app/assets/images/test_product.jpg").open,
									              category_id: category_10.id
	                            )
pod_category_2.products.create( title:'Клеточка маточная металическая (Титова)',
									              rang:'2',
									              status: 'Под заказ',
									              price: '105,35',
									              description: 'Клеточка позволяет пасечникам исключить возможность контакта матки с пчелами. Позволяя матке спокойно пропитаться запахом улья и дать остальным пчелам привыкнуть к себе. Все стенки клеточки имеют отверстия, благодаря им, матка находится в непосредственной близости от пчел, что ускоряет процесс их привыкания к матке и увеличивает шансы на ее успешное принятие в семью. Эта модель изоляционной клеточки, очень популярна среди многих пасечников по всему миру, проста в использовании и надежна.',
									              image_url: Rails.root.join("app/assets/images/test_product.jpg").open,
									              category_id: category_10.id
	                            )
pod_category_2.products.create( title:'Каток для распечатывания сот «Ежик» деревянная ручка',
									              rang:'3',
									              status: 'Скрыть',
									              price: '1000,35',
									              description: 'Удобный инструмент, с помощью которого можно правильно распечатать пчелиные соты, перед откачкой меда. Принцип использования катка подразумевает под собой неглубокое прокалывание и распечатывание крышечек из воска.',
									              image_url: Rails.root.join("app/assets/images/test_product.jpg").open,
									              category_id: category_10.id
	                            )
pod_category_3 = category_10.pod_categories.create(title: 'От грибковых болезней',
                                                  rang: '1',
									                                image_url: Rails.root.join("app/assets/images/test_product.jpg").open)
pod_category_3.products.create( title:'Колпачок квадратный 90мм',
									              rang:'1',
									              status: 'В наличие',
									              price: '10000,45',
									              description: 'При помощи такого колпачка, вы с легкостью сможете изолировать матку, находящуюся на соте, не затрачивая на это много времени, самое главное, подобный способ временной изоляции наиболее безопасный для самой матки. Колпачки для изоляции используются пасечниками с разными целями, временной изоляции матки во время проведения работ в улье, или изоляции матки в процессе ее мечения.',
									              image_url: Rails.root.join("app/assets/images/test_product.jpg").open,
									              category_id: category_10.id
	                            )
pod_category_3.products.create( title:'Клеточка маточная металическая (Титова)',
									              rang:'2',
									              status: 'Под заказ',
									              price: '105,35',
									              description: 'Клеточка позволяет пасечникам исключить возможность контакта матки с пчелами. Позволяя матке спокойно пропитаться запахом улья и дать остальным пчелам привыкнуть к себе. Все стенки клеточки имеют отверстия, благодаря им, матка находится в непосредственной близости от пчел, что ускоряет процесс их привыкания к матке и увеличивает шансы на ее успешное принятие в семью. Эта модель изоляционной клеточки, очень популярна среди многих пасечников по всему миру, проста в использовании и надежна.',
									              image_url: Rails.root.join("app/assets/images/test_product.jpg").open,
									              category_id: category_10.id
	                            )
pod_category_3.products.create( title:'Каток для распечатывания сот «Ежик» деревянная ручка',
									              rang:'3',
									              status: 'Скрыть',
									              price: '1000,35',
									              description: 'Удобный инструмент, с помощью которого можно правильно распечатать пчелиные соты, перед откачкой меда. Принцип использования катка подразумевает под собой неглубокое прокалывание и распечатывание крышечек из воска.',
									              image_url: Rails.root.join("app/assets/images/test_product.jpg").open,
									              category_id: category_10.id
	                            )
pod_category_4 = category_10.pod_categories.create(title: 'От гнильцовых болезней',
                                                  rang: '1',
									                                image_url: Rails.root.join("app/assets/images/test_product.jpg").open)
pod_category_4.products.create( title:'Колпачок квадратный 90мм',
									              rang:'1',
									              status: 'В наличие',
									              price: '10000,45',
									              description: 'При помощи такого колпачка, вы с легкостью сможете изолировать матку, находящуюся на соте, не затрачивая на это много времени, самое главное, подобный способ временной изоляции наиболее безопасный для самой матки. Колпачки для изоляции используются пасечниками с разными целями, временной изоляции матки во время проведения работ в улье, или изоляции матки в процессе ее мечения.',
									              image_url: Rails.root.join("app/assets/images/test_product.jpg").open,
									              category_id: category_10.id
	                            )
pod_category_4.products.create( title:'Клеточка маточная металическая (Титова)',
									              rang:'2',
									              status: 'Под заказ',
									              price: '105,35',
									              description: 'Клеточка позволяет пасечникам исключить возможность контакта матки с пчелами. Позволяя матке спокойно пропитаться запахом улья и дать остальным пчелам привыкнуть к себе. Все стенки клеточки имеют отверстия, благодаря им, матка находится в непосредственной близости от пчел, что ускоряет процесс их привыкания к матке и увеличивает шансы на ее успешное принятие в семью. Эта модель изоляционной клеточки, очень популярна среди многих пасечников по всему миру, проста в использовании и надежна.',
									              image_url: Rails.root.join("app/assets/images/test_product.jpg").open,
									              category_id: category_10.id
	                            )
pod_category_4.products.create( title:'Каток для распечатывания сот «Ежик» деревянная ручка',
									              rang:'3',
									              status: 'Скрыть',
									              price: '1000,35',
									              description: 'Удобный инструмент, с помощью которого можно правильно распечатать пчелиные соты, перед откачкой меда. Принцип использования катка подразумевает под собой неглубокое прокалывание и распечатывание крышечек из воска.',
									              image_url: Rails.root.join("app/assets/images/test_product.jpg").open,
									              category_id: category_10.id
	                            )

category_11 = Category.create( title:'Ульи',
									            rang:'11',
									            image_url: Rails.root.join("app/assets/images/test_product.jpg").open)
pod_category_1 = category_11.pod_categories.create(title: 'Комплектующее для ульев',
                                                  rang: '1',
									                                image_url: Rails.root.join("app/assets/images/test_product.jpg").open)
pod_category_1.products.create( title:'Колпачок квадратный 90мм',
									              rang:'1',
									              status: 'В наличие',
									              price: '10000,45',
									              description: 'При помощи такого колпачка, вы с легкостью сможете изолировать матку, находящуюся на соте, не затрачивая на это много времени, самое главное, подобный способ временной изоляции наиболее безопасный для самой матки. Колпачки для изоляции используются пасечниками с разными целями, временной изоляции матки во время проведения работ в улье, или изоляции матки в процессе ее мечения.',
									              image_url: Rails.root.join("app/assets/images/test_product.jpg").open,
									              category_id: category_11.id
	                            )
pod_category_1.products.create( title:'Клеточка маточная металическая (Титова)',
									              rang:'2',
									              status: 'Под заказ',
									              price: '105,35',
									              description: 'Клеточка позволяет пасечникам исключить возможность контакта матки с пчелами. Позволяя матке спокойно пропитаться запахом улья и дать остальным пчелам привыкнуть к себе. Все стенки клеточки имеют отверстия, благодаря им, матка находится в непосредственной близости от пчел, что ускоряет процесс их привыкания к матке и увеличивает шансы на ее успешное принятие в семью. Эта модель изоляционной клеточки, очень популярна среди многих пасечников по всему миру, проста в использовании и надежна.',
									              image_url: Rails.root.join("app/assets/images/test_product.jpg").open,
									              category_id: category_11.id
	                            )
pod_category_1.products.create( title:'Каток для распечатывания сот «Ежик» деревянная ручка',
									              rang:'3',
									              status: 'Скрыть',
									              price: '1000,35',
									              description: 'Удобный инструмент, с помощью которого можно правильно распечатать пчелиные соты, перед откачкой меда. Принцип использования катка подразумевает под собой неглубокое прокалывание и распечатывание крышечек из воска.',
									              image_url: Rails.root.join("app/assets/images/test_product.jpg").open,
									              category_id: category_11.id
	                            )
pod_category_2 = category_11.pod_categories.create(title: 'Рамки для ульев',
                                                  rang: '1',
									                                image_url: Rails.root.join("app/assets/images/test_product.jpg").open)
pod_category_2.products.create( title:'Колпачок квадратный 90мм',
									              rang:'1',
									              status: 'В наличие',
									              price: '10000,45',
									              description: 'При помощи такого колпачка, вы с легкостью сможете изолировать матку, находящуюся на соте, не затрачивая на это много времени, самое главное, подобный способ временной изоляции наиболее безопасный для самой матки. Колпачки для изоляции используются пасечниками с разными целями, временной изоляции матки во время проведения работ в улье, или изоляции матки в процессе ее мечения.',
									              image_url: Rails.root.join("app/assets/images/test_product.jpg").open,
									              category_id: category_11.id
	                            )
pod_category_2.products.create( title:'Клеточка маточная металическая (Титова)',
									              rang:'2',
									              status: 'Под заказ',
									              price: '105,35',
									              description: 'Клеточка позволяет пасечникам исключить возможность контакта матки с пчелами. Позволяя матке спокойно пропитаться запахом улья и дать остальным пчелам привыкнуть к себе. Все стенки клеточки имеют отверстия, благодаря им, матка находится в непосредственной близости от пчел, что ускоряет процесс их привыкания к матке и увеличивает шансы на ее успешное принятие в семью. Эта модель изоляционной клеточки, очень популярна среди многих пасечников по всему миру, проста в использовании и надежна.',
									              image_url: Rails.root.join("app/assets/images/test_product.jpg").open,
									              category_id: category_11.id
	                            )
pod_category_2.products.create( title:'Каток для распечатывания сот «Ежик» деревянная ручка',
									              rang:'3',
									              status: 'Скрыть',
									              price: '1000,35',
									              description: 'Удобный инструмент, с помощью которого можно правильно распечатать пчелиные соты, перед откачкой меда. Принцип использования катка подразумевает под собой неглубокое прокалывание и распечатывание крышечек из воска.',
									              image_url: Rails.root.join("app/assets/images/test_product.jpg").open,
									              category_id: category_11.id
	                            )
pod_category_3 = category_11.pod_categories.create(title: 'Кормушки и пыльцесборники',
                                                  rang: '1',
									                                image_url: Rails.root.join("app/assets/images/test_product.jpg").open)
pod_category_3.products.create( title:'Колпачок квадратный 90мм',
									              rang:'1',
									              status: 'В наличие',
									              price: '10000,45',
									              description: 'При помощи такого колпачка, вы с легкостью сможете изолировать матку, находящуюся на соте, не затрачивая на это много времени, самое главное, подобный способ временной изоляции наиболее безопасный для самой матки. Колпачки для изоляции используются пасечниками с разными целями, временной изоляции матки во время проведения работ в улье, или изоляции матки в процессе ее мечения.',
									              image_url: Rails.root.join("app/assets/images/test_product.jpg").open,
									              category_id: category_11.id
	                            )
pod_category_3.products.create( title:'Клеточка маточная металическая (Титова)',
									              rang:'2',
									              status: 'Под заказ',
									              price: '105,35',
									              description: 'Клеточка позволяет пасечникам исключить возможность контакта матки с пчелами. Позволяя матке спокойно пропитаться запахом улья и дать остальным пчелам привыкнуть к себе. Все стенки клеточки имеют отверстия, благодаря им, матка находится в непосредственной близости от пчел, что ускоряет процесс их привыкания к матке и увеличивает шансы на ее успешное принятие в семью. Эта модель изоляционной клеточки, очень популярна среди многих пасечников по всему миру, проста в использовании и надежна.',
									              image_url: Rails.root.join("app/assets/images/test_product.jpg").open,
									              category_id: category_11.id
	                            )
pod_category_3.products.create( title:'Каток для распечатывания сот «Ежик» деревянная ручка',
									              rang:'3',
									              status: 'Скрыть',
									              price: '1000,35',
									              description: 'Удобный инструмент, с помощью которого можно правильно распечатать пчелиные соты, перед откачкой меда. Принцип использования катка подразумевает под собой неглубокое прокалывание и распечатывание крышечек из воска.',
									              image_url: Rails.root.join("app/assets/images/test_product.jpg").open,
									              category_id: category_11.id
	                            )
pod_category_4 = category_11.pod_categories.create(title: 'Утеплители и холстики',
                                                  rang: '1',
									                                image_url: Rails.root.join("app/assets/images/test_product.jpg").open)
pod_category_4.products.create( title:'Колпачок квадратный 90мм',
									              rang:'1',
									              status: 'В наличие',
									              price: '10000,45',
									              description: 'При помощи такого колпачка, вы с легкостью сможете изолировать матку, находящуюся на соте, не затрачивая на это много времени, самое главное, подобный способ временной изоляции наиболее безопасный для самой матки. Колпачки для изоляции используются пасечниками с разными целями, временной изоляции матки во время проведения работ в улье, или изоляции матки в процессе ее мечения.',
									              image_url: Rails.root.join("app/assets/images/test_product.jpg").open,
									              category_id: category_11.id
	                            )
pod_category_4.products.create( title:'Клеточка маточная металическая (Титова)',
									              rang:'2',
									              status: 'Под заказ',
									              price: '105,35',
									              description: 'Клеточка позволяет пасечникам исключить возможность контакта матки с пчелами. Позволяя матке спокойно пропитаться запахом улья и дать остальным пчелам привыкнуть к себе. Все стенки клеточки имеют отверстия, благодаря им, матка находится в непосредственной близости от пчел, что ускоряет процесс их привыкания к матке и увеличивает шансы на ее успешное принятие в семью. Эта модель изоляционной клеточки, очень популярна среди многих пасечников по всему миру, проста в использовании и надежна.',
									              image_url: Rails.root.join("app/assets/images/test_product.jpg").open,
									              category_id: category_11.id
	                            )
pod_category_4.products.create( title:'Каток для распечатывания сот «Ежик» деревянная ручка',
									              rang:'3',
									              status: 'Скрыть',
									              price: '1000,35',
									              description: 'Удобный инструмент, с помощью которого можно правильно распечатать пчелиные соты, перед откачкой меда. Принцип использования катка подразумевает под собой неглубокое прокалывание и распечатывание крышечек из воска.',
									              image_url: Rails.root.join("app/assets/images/test_product.jpg").open,
									              category_id: category_11.id
	                            )
pod_category_5 = category_11.pod_categories.create(title: 'Разделительные решетки',
                                                  rang: '1',
									                                image_url: Rails.root.join("app/assets/images/test_product.jpg").open)
pod_category_5.products.create( title:'Колпачок квадратный 90мм',
									              rang:'1',
									              status: 'В наличие',
									              price: '10000,45',
									              description: 'При помощи такого колпачка, вы с легкостью сможете изолировать матку, находящуюся на соте, не затрачивая на это много времени, самое главное, подобный способ временной изоляции наиболее безопасный для самой матки. Колпачки для изоляции используются пасечниками с разными целями, временной изоляции матки во время проведения работ в улье, или изоляции матки в процессе ее мечения.',
									              image_url: Rails.root.join("app/assets/images/test_product.jpg").open,
									              category_id: category_11.id
	                            )
pod_category_5.products.create( title:'Клеточка маточная металическая (Титова)',
									              rang:'2',
									              status: 'Под заказ',
									              price: '105,35',
									              description: 'Клеточка позволяет пасечникам исключить возможность контакта матки с пчелами. Позволяя матке спокойно пропитаться запахом улья и дать остальным пчелам привыкнуть к себе. Все стенки клеточки имеют отверстия, благодаря им, матка находится в непосредственной близости от пчел, что ускоряет процесс их привыкания к матке и увеличивает шансы на ее успешное принятие в семью. Эта модель изоляционной клеточки, очень популярна среди многих пасечников по всему миру, проста в использовании и надежна.',
									              image_url: Rails.root.join("app/assets/images/test_product.jpg").open,
									              category_id: category_11.id
	                            )
pod_category_5.products.create( title:'Каток для распечатывания сот «Ежик» деревянная ручка',
									              rang:'3',
									              status: 'Скрыть',
									              price: '1000,35',
									              description: 'Удобный инструмент, с помощью которого можно правильно распечатать пчелиные соты, перед откачкой меда. Принцип использования катка подразумевает под собой неглубокое прокалывание и распечатывание крышечек из воска.',
									              image_url: Rails.root.join("app/assets/images/test_product.jpg").open,
									              category_id: category_11.id
	                            )
pod_category_6 = category_11.pod_categories.create(title: 'Ульи',
                                                  rang: '1',
									                                image_url: Rails.root.join("app/assets/images/test_product.jpg").open)
pod_category_6.products.create( title:'Колпачок квадратный 90мм',
									              rang:'1',
									              status: 'В наличие',
									              price: '10000,45',
									              description: 'При помощи такого колпачка, вы с легкостью сможете изолировать матку, находящуюся на соте, не затрачивая на это много времени, самое главное, подобный способ временной изоляции наиболее безопасный для самой матки. Колпачки для изоляции используются пасечниками с разными целями, временной изоляции матки во время проведения работ в улье, или изоляции матки в процессе ее мечения.',
									              image_url: Rails.root.join("app/assets/images/test_product.jpg").open,
									              category_id: category_11.id
	                            )
pod_category_6.products.create( title:'Клеточка маточная металическая (Титова)',
									              rang:'2',
									              status: 'Под заказ',
									              price: '105,35',
									              description: 'Клеточка позволяет пасечникам исключить возможность контакта матки с пчелами. Позволяя матке спокойно пропитаться запахом улья и дать остальным пчелам привыкнуть к себе. Все стенки клеточки имеют отверстия, благодаря им, матка находится в непосредственной близости от пчел, что ускоряет процесс их привыкания к матке и увеличивает шансы на ее успешное принятие в семью. Эта модель изоляционной клеточки, очень популярна среди многих пасечников по всему миру, проста в использовании и надежна.',
									              image_url: Rails.root.join("app/assets/images/test_product.jpg").open,
									              category_id: category_11.id
	                            )
pod_category_6.products.create( title:'Каток для распечатывания сот «Ежик» деревянная ручка',
									              rang:'3',
									              status: 'Скрыть',
									              price: '1000,35',
									              description: 'Удобный инструмент, с помощью которого можно правильно распечатать пчелиные соты, перед откачкой меда. Принцип использования катка подразумевает под собой неглубокое прокалывание и распечатывание крышечек из воска.',
									              image_url: Rails.root.join("app/assets/images/test_product.jpg").open,
									              category_id: category_11.id
	                            )
