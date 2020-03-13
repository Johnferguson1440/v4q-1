require 'watir'  
require 'rspec'  # this adds the 


describe 'A user must have a password to make an appointment' do
browser = nil
   
	it 'Given I want to make an appointment' do
		browser = Watir::Browser.new  
		
		browser.goto 'http://demoaut.katalon.com'
		browser.link(id: 'btn-make-appointment').click
	end
	
    it 'and I enter a valid username'do
		browser.text_field(id: 'txt-username').set 'John Doe'
	end
    it 'When I enter a bad password'do
		browser.text_field(id: 'txt-password').set ''
	end
    it 'and I click the Login button'do
		browser.button(id: 'btn-login').click
	end
    it 'Then I get an error message'do
		error_msg = browser.p(class: 'text-danger').text
		puts error_msg
		expect(error_msg).to be == 'Login failed! Please ensure the username and password are valid.'
	end
end
