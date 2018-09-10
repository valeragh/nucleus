require 'rails_helper'

feature 'Letter management' do
	scenario "create new letter on root_path" do

		visit root_path
	  expect{
	  	click_link('Контакты', match: :first)
	  	fill_in 'letter[name]', with: 'Danny'
	  	fill_in 'letter[email]', with: 'test@test.com'
	  	fill_in 'letter[description]', with: 'test'
	  	click_button 'Отправить'
	  }.to change(Letter, :count).by(1)
	  expect(current_path).to eq root_path
	  expect(page).to have_content 'Спасибо за Ваше обращение, наши администраторы ответят Вам в ближайшее время'
	end

end