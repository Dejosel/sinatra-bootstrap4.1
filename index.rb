require 'sinatra'

require 'make_todo'

get '/' do
	@tasks = Tarea.all 
	@title = 'Todas mis Tareas'
	erb :home
end

post '/' do
	@title = 'Error'
	if params[:task] == "" || params[:task] == nil
		erb :error
	else
		Tarea.create("#{params[:task]}")  
		redirect '/'   
	end
end  

get '/:id/delete' do
	@task = Tarea.find("#{params[:id]}")
	@title = "Confirmar eliminación de la tarea ##{params[:id]}"
	erb :delete
end

delete '/:id' do
	Tarea.destroy("#{params[:id]}")
	redirect '/'
end

get '/:id/complete' do
	Tarea.update("#{params[:id]}")
	redirect '/'
end