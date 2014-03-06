get '/event/new' do
  @user = User.find(session[:id])
  erb :create_event
end

post "/event/new" do
  params[:event].inspect
  params[:event][:starts_at] = Time.now + (rand(61) - 30).days
  params[:event][:ends_at] = Time.now + (rand(61) - 30).days

  event = Event.create(params[:event])
  redirect '/'
end


get "/event/:id/edit" do
  @user = User.find(session[:id])
  @event = Event.find(params[:id])
  erb :edit_event
end

post '/event/:id/edit' do
  event = Event.update(params[:id], params[:event])
  redirect '/'
end
