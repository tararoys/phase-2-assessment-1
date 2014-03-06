get '/' do
  # Look in app/views/index.erb
  @user = User.find(session[:id]) if session[:id]
  erb :index
end
