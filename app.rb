require "bundler/setup"
Bundler.require(:default)
require 'pry'

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get '/' do
  @categories=Category.all
  @recipes = Recipe.all
  erb :index
end

post '/categories' do
  Category.create(:title => params['title'])
  redirect '/'
end

get '/category/:id' do
  @category = Category.find(params['id'].to_i)
  erb :category
end

patch '/category/:id' do
  @category = Category.find(params['id'].to_i)
  @category.update(:title => params['title'])
  erb :category
end

delete '/category/:id' do
  category = Category.find(params['id'].to_i)
  category.delete
  redirect '/'
end

get '/recipes/new' do
  @categories = Category.all
  erb :recipe_form
end

post '/recipes' do
  recipe = Recipe.create(:name => params['name'], :ingredients => params['ingredients'], :instructions => params['instructions'])
  redirect '/'
end

get '/recipe/:id' do
  @categories = Category.all
  @recipe = Recipe.find(params['id'].to_i)
  erb :recipe
end

patch '/recipe/:id' do
  @recipe = Recipe.find(params['id'].to_i)
  name = params['name']
  ingredients = params['ingredients']
  instructions = params['instructions']
  if (name.split('').any?)
    @recipe.update({:name => name})
  else
    @recipe.update({:name => "#{@recipe.name}"})
  end
  if (ingredients.split('').any?)
    @recipe.update({:ingredients => ingredients})
  else
    @recipe.update({:ingredients => "#{@recipe.ingredients}"})
  end
  if (instructions.split('').any?)
    @recipe.update({:instructions => instructions})
  else
    @recipe.update({:instructions => "#{@recipe.instructions}"})
  end
  erb :recipe
end

delete '/recipe/:id' do
  recipe = Recipe.find(params['id'].to_i)
  recipe.delete
  redirect '/'
end

post '/recipe/:id' do
  @recipe = Recipe.find(params['id'].to_i)
  @recipe.update(:category_ids => params['categories_id'])
  @categories = Category.all
  redirect "/recipe/#{@recipe.id}"
end
