require "spec_helper"

describe Tag do
  describe '#recipes' do
    it('assign recipes to a tag') do
      tag = Tag.create(:ingredient => 'chocolate')
      recipe1 = Recipe.create(:name => 'chocolate ganache', :tag_id => tag.id)
      recipe2 = Recipe.create(:name => 'cake', :tag_id => tag.id)
      expect(tag.recipes).to eq [recipe1, recipe2]
    end
  end
end
