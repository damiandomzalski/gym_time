class UserDecorator < Draper::Decorator
  delegate_all

  def full_name
    if first_name.blank? && last_name.blank?
      'Brak danych'
    else
      "#{ first_name } #{ last_name }".strip
    end
  end
end
