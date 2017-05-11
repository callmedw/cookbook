class Recipe < ActiveRecord::Base
  has_and_belongs_to_many :categories
  validates :title, :presence => true
  before_save :uppercase

  private

  def uppercase
      self.title = title.upcase
    end
end
end
