module AuthHelper
  def login
    visit root_path
    fill_in "username", :with => "user"
    fill_in "password", :with => "secret"
    click_button "Login"
  end
end
