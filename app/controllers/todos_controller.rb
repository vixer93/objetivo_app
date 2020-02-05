class TodosController < ApplicationController
  protect_from_forgery
  def index
    @goal  = Goal.find(params[:goal_id])
    @stage = @goal.stages.find(params[:stage_id])
    @todo  = @stage.todos.new

    @active_todos = Todo.where(stage_id: @stage.id, status: false)
    @done_todos   = Todo.where(stage_id: @stage.id, status: true)
  end

  def create
    @todo = Todo.new(todo_params)
    if @todo.save
      redirect_to goal_stage_todos_path, notice: "新規Todoを作成しました"
    else
      render :index
    end
  end

  def update
    @todo = Todo.find(params[:id])
    @todo.update(todo_params)
    render json: @todo
  end

  def destroy
    Todo.destroy(params[:id])
    redirect_to goal_stage_todos_path, notice: "Todoを削除しました"
  end

  private
  def todo_params
    params.require(:todo).permit(:title, :status).merge(stage_id: params[:stage_id])
  end
end
