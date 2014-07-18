module ApplicationHelper

  # Retourner un titre basé sur la page.
  def titre
    base_title = "Ruby on Rails Tutorial Sample App"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end
end