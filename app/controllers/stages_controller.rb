class StagesController < ApplicationController
  def index
    @stage = Stage.all
  end

  def new
   @stage = Stage.new
  end

  def create
    @stage = Stage.create(stage_params)
    redirect_to
  end

  def edit
  end
  def update
  end
  def destory
  end

  private
  def stage_params
    params.require(:stages).permit(:title, :detail, :start, :end)
  end

end
