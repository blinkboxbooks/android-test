module PageObjectModel
  class InfoPage < UserLibraryPage
    trait "* id:'toolbar' TextView text:'Info'"
    element :versions_title, "webView css:'*' nodeName:'H4' textContent:'\n    Versions\n'"
    element :about_blinkbox_title, "webView css:'*' nodeName:'H4' textContent:'\n    About blinkbox books\n'"
    element :who_we_are_title, "webView css:'*' nodeName:'H4' textContent:'\n    Who are we?\n'"
    element :why_choose_us_title, "webView css:'*' nodeName:'H4' textContent:'\n    Why choose us?\n'"
    element :libraries_title, "webView css:'*' nodeName:'H4' textContent:'\n    Libraries\n'"
    element :fonts_title, "webView css:'*' nodeName:'H4' textContent:'\n    Fonts\n'"
    element :versions_sub_text, "webView css:'*' nodeName:'P' {textContent CONTAINS 'blinkbox books for Android'}"
    element :about_blinkbox_sub_text, "webView css:'*' nodeName:'P' {textContent CONTAINS 'blinkbox books is a service'}"
    element :about_who_we_are_sub_text, "webView css:'*' nodeName:'P' {textContent CONTAINS 'We are an online'}"
  end
end

module PageObjectModel
  def info_page
    @_info_page ||= page(InfoPage)
  end
end
