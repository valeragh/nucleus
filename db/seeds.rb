category = Category.create(
	title: 'Пчелопродукты',
	image_url: Rails.root.join("app/assets/images/data/mir_meda_1.jpg").open)
category.pod_categories.create(
	title: 'Мед',
	rang: '1',
	image_url: Rails.root.join("app/assets/images/data/mir_meda_1.jpg").open)
category.pod_categories.create(
	title: 'Другое',
	rang: '1',
	image_url: Rails.root.join("app/assets/images/android-chrome-512x512.png").open)