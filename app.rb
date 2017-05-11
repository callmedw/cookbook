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
