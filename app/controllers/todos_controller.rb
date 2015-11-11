class TodosController < ApplicationController

  def index
    @todos = session[:todos]
    @todos = [] unless @todos
  end

  def new

  end

  def create
    todo = {title: params[:title]}
    if session[:todos].nil?
      session[:todos] = [todo]
    else
      session[:todos] << todo
    end


    redirect_to "/todos"
  end

  private

  def todo_params
    params.permit(:title)
  end
end
