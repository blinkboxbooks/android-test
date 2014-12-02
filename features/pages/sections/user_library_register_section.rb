module PageObjectModel
  class UserLibraryRegisterSection < PageObjectModel::Page
    trait "* id:'library_register_button' text:'Register'"
    element :register_button, "* id:'library_register_button' text:'Register'"
    element :sign_in_link, "* id:'library_register_sign_in' text:'Sign in'"
  end
end
