class TodosController < ApplicationController
  before_action :set_todo, only: [ :edit, :update, :destroy, :toggle_pin ]

  def index
    @todos = Todo.all
  end

  def new
    @todo = Todo.new
  end

  def create
    @todo = Todo.new(todo_params)
    if @todo.save
      redirect_to todos_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @todo.update(todo_params)
      redirect_to todos_path
    else
      render :edit
    end
  end

  def destroy
    @todo.destroy
    redirect_to todos_path
  end

  def toggle_pin
    @todo.toggle(:checkbox).save
    redirect_to todos_path
  end

  private

  def todo_params
    params.require(:todo).permit(:title, :introduction, :checkbox)
  end

  def set_todo
    @todo = Todo.find(params[:id])
    redirect_to todo_url, status: :see_other if @todo.nil?
  end
end
