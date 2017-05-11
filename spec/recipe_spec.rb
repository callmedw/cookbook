require "spec_helper"

describe Recipe do
  it { should have_and_belong_to_many(:categories)}

  it 'capitalizes the recipe name' do
    recipe = Recipe.create(:name => 'christmas cheer')
    expect(recipe.name).to eq('CHRISTMAS CHEER')
  end

  it 'validates the presence of a name' do
    recipe = Recipe.create(:name => "")
    expect(recipe.save).to eq(false)
  end
end
end
