require 'rails_helper'

RSpec.feature 'Contact Form', :type => :feature do
	scenario 'should exist after Message#new' do
		visit '/contact-me'
		assert_selector 'form'
		expect(page).to have_field('Name')
		expect(page).to have_field('Email')
		expect(page).to have_field('Body')
		expect(page).to have_button('Send')
	end

	scenario 'should have successful POST' do
		expect do
			visit '/contact-me'
			fill_in 'Name', with: 'Joe Shmoe'
			fill_in 'Email', with: 'joe@gmail.com'
			fill_in 'Body', with: 'Hey id like to meet you.'
			click_button 'Send'
		end.to change{ActionMailer::Base.deliveries.size}.from(0).to(1)

		expect(page.current_path).to eq root_path
		expect(page).to have_content('Your message was successfully sent!')
	end

	scenario 'invalid POST create' do
		visit '/contact-me'
		fill_in 'Name', with: ''
		fill_in 'Email', with: ''
		fill_in 'Body', with: ''
		click_button 'Send'

		expect(page).to have_content(/(Name|Email|Body).* blank/)
	end


end