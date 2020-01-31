class StagesController < ApplicationController



  def index
    @stages = Stage.where('goal_id = params[:goal_id]')
  end

  def new
    @goal = Goal.find(params[:goal_id])
    @stage = Stage.new
  end

  def create
    @goal = Goal.find(params[:goal_id])
    @stage = Stage.new(stage_params)
    if @stage.save
      redirect_to "/goals/#{@goal.id}/stages",notice: 'ステージを登録しました。'
    else
      flash.now[:notice] = "エラーが発生しました。もう一度入力してください。"
      render :new
    end
  end

  def edit
    @goal = Goal.find(params[:goal_id])
    @stage = Stage.find(params[:id])
  end

  def update
    @stage = Stage.find(params[:id])
    if @stage.update(stage_params)
      redirect_to goal_stage_path,notice: 'ステージを登録しました。'
    else
      render :edit, notice: 'エラーが発生しました。もう一度入力してください。'
    end
  end

  def destory
    stage = Stage.find(params[:id])
    stage.destroy
  end

  private
  def stage_params
    params.require(:stage).permit(:title, :detail, :start, :end).merge(goal_id: params[:goal_id])
  end

end
