require "bundler/setup"
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get '/' do
  @categories=Category.all
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
