class StagesController < ApplicationController
  def index
    @stage = Stage.all
  end

  def new
    @goal = Goal.find(params[:goal_id])
    @stage = Stage.new
  end

  def create
    @stage = Stage.create(stage_params)
    redirect_to goal_stage_path
  end

  def edit
    @goal = Goal.find(params[:goal_id])
    @stage = Stage.find(params[:id])
  end

  def update
    stage = Stage.find(params[:id])
    stage.update
    edirect_to goal_stage_path
  end
  def destory
    stage = Stage.find(params[:id])
    stage.destroy
  end

  private
  def stage_params
    params.require(:stages).permit(:title, :detail, :start, :end).merge(goal_id: params[:goal_id])
  end

end
