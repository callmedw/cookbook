class Category < ActiveRecord::Base
  has_and_belongs_to_many :recipes
  before_save :uppercase

  private

  def uppercase
      self.title = title.upcase
    end
end
