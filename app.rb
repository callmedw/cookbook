require "bundler/setup"
Bundler.require(:default)

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
  erb :recipe_form
end

post '/recipes' do
  Recipe.create(:name => params['name'], :ingredients => params['indgredients'], :instructions => params['instructions'])
  redirect '/'
end

get '/recipe/:id' do
  @recipe = Recipe.find(params['id'].to_i)
  erb :recipe
end

patch '/recipe/:id' do
  @recipe = Recipe.find(params['id'].to_i)
  @recipe.update(:name => params['name'])
  erb :recipe
end

delete '/recipe/:id' do
  recipe = Recipe.find(params['id'].to_i)
  recipe.delete
  redirect '/'
end
