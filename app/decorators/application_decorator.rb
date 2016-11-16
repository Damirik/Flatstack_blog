class ApplicationDecorator < Draper::Decorator
  delegate :to_model
end
