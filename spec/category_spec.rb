require 'spec_helper'

describe Category do
  it { should have_and_belong_to_many(:recipes)}

  it 'capitalizes the category title' do
    category = Category.create(:title => 'christmas cheer')
    expect(category.title).to eq('CHRISTMAS CHEER')
  end

  it 'validates the presence of a title' do
    category = Category.create(:title => "")
    expect(category.save).to eq(false)
  end
end
