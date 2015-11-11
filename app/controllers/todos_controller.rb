class TodosController < ApplicationController

  def index
    if params.has_key? :q
      @todos = Todo.where("title LIKE ?", "%#{params[:q]}%")
    else
      @todos = Todo.all
    end

  end

  def new

  end

  def create
    todo = Todo.new title: params[:title], assigned_to: params[:assigned_to]

    if todo.save
      flash[:notice] = "Todo was saved successfully"
    else
      flash[:notice] = "Todo was not saved"
    end

    redirect_to "/todos"
  end

  private

  def todo_params
    params.permit(:title)
  end
end
