require 'spec_helper'

describe Category do
  it { should have_and_belong_to_many(:recipes)}

  describe '#uppercase' do
    it 'capitalizes the category title' do
      category = Category.create({:title => 'christmas cheer'})
      expect(category.title).to eq('CHRISTMAS CHEER')
    end
  end
end
