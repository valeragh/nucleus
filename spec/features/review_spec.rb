require 'rails_helper'

feature 'Review management' do
	scenario "create new review on root_path" do

		visit root_path
	  expect{
	  	click_link('Для вывода маток', match: :first)
	  	click_link('Клеточки', match: :first)
	  	click_link('Подробней', match: :first)
	  	click_link('Оставить отзыв')
	  	fill_in 'review[name]', with: 'Danny'
	  	fill_in 'review[description]', with: 'test'
	  	click_button 'Отправить'
	  }.to change(Review, :count).by(1)
	  expect(current_path).to eq root_path
	  expect(page).to have_content 'Спасибо за Ваш отзыв. После модерации он будет опубликован'
	end

end