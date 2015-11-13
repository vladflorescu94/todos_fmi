class TodosController < ApplicationController

  def create
    todo = Todo.new title: params[:title], assigned_to: params[:assigned_to]

    if todo.save
      flash[:notice] = "Todo was saved successfully."
      redirect_to "/todos"
    else
      flash[:notice] = todo.errors.full_messages.join(". ") #"There was an error while saving your todo."
      redirect_to "/todos/new"
    end
  end

  def index
    if params.has_key? :q
      @todos = Todo.where("title LIKE ?", "%#{params[:q]}%")
    else
      @todos = Todo.all
    end
  end

  def change_title
    todo = Todo.find params[:id]
    todo.title = params[:title]

    if todo.save
      render json: todo.to_json(only: :title)
    else
      render json: { errors: todo.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  def destroy
    todo = Todo.find(params[:id])

    if todo.destroy
      redirect_to "/todos"
    else
      flash[:notice] = @todo.errors.full_messages.join(". ")
    end
  end

  private

  def todo_params
    params.permit(:title)
  end
end
