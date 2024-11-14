class TodosController < ApplicationController
  before_action :set_todo, only: [ :edit, :update, :destroy, :toggle_complete ]

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

  def toggle_complete
    @todo.update(checkbox: !@todo.checkbox) # checkbox の状態を反転
    @todo.save
    redirect_to todos_path, notice: "タスクの状態を更新しました"
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
