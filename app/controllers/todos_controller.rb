class TodosController < ApplicationController
  def index
    @stage = Stage.find(params[:stage_id])
    @active_todos = Todo.where(stage_id: @stage.id, status: false)
    @done_todos   = Todo.where(stage_id: @stage.id, status: true)
  end

  def create
  end
end
