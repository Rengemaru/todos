class TodosController < ApplicationController
  before_action :set_todo, only: [ :edit, :update, :destroy, :toggle_complete ]
  before_action :set_date, only: [ :update, :edit ]
  def index
    @todos = Todo.all
  end

  def new
    @todo = Todo.new
  end

  def create
    @todo = Todo.new(todo_params)
    set_date
    if @todo.save
      redirect_to todos_path, notice: "タスクを作成しました。"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @todo.update(todo_params)
      redirect_to todos_path, notice: "タスクを更新しました。"
    else
      render :edit
    end
  end

  def destroy
    @todo.destroy
    redirect_to todos_path, notice: "タスクを削除しました。"
  end

  def toggle_complete
    @todo.update(checkbox: !@todo.checkbox) # checkbox の状態を反転
    redirect_to todos_path, notice: "タスクの状態を更新しました。"
  end

  private

  def todo_params
    params.require(:todo).permit(:title, :introduction, :checkbox, :date, :set_date)
  end

  def set_todo
    @todo = Todo.find(params[:id])
  end

  # タスクの日付をセットする
  def set_date
    if @todo.date.present?
      @todo.set_date = @todo.date.strftime("%m月 %d日")
    else
      @todo.set_date = "日付未設定"
    end
  end
end
