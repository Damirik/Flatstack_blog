class UserDecorator < Draper::Decorator
  delegate :full_name, :email

  def full_name_with_email
    "#{object.full_name} (#{object.email})"
  end
end
