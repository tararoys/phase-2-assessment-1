get '/users/login' do
  erb :login
end

post '/users/login' do
  puts params.inspect
  params.inspect
  current_user = User.find_by_email(params[:user][:email])
  current_user = current_user.authenticate(params[:user][:password])
  if current_user 
    session[:id] = current_user.id
    redirect "/"
  else 
    redirect "/users/login"
  end
end

get '/users/logout' do 
  session[:id] = nil
  redirect "/"
end