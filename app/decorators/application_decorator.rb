class ApplicationDecorator < Draper::Decorator
  delegate :to_model

  def self.collection_decorator_class
    PaginatingDecorator
  end

  def formatted_created_at
    object.created_at.strftime("%m/%d/%Y - %H:%M")
  end
end
