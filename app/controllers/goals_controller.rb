class GoalsController < ApplicationController

  def index
    @goals = Goal.where(user_id: current_user.id)
  end

  def new
    @goal = Goal.new
  end

  def create
    goal = current_user.goals.new(goal_params)
    if goal.save
      redirect_to new_goal_stage_path(goal_id: goal.id)
    else
      render :new
    end
  end

  def now
    @goal = current_user.goals.find_by(status: 0)
    @stage = nil
    @todos = nil

    if @goal.present?
      @stage = @goal.stages.where(status: false).first
    end
    
    if @stage.present? && @stage.todos.present?
      @todos = @stage.todos
    end
  end

  def pend
    goal = Goal.find(params[:goal_id])
    if goal.update(status: 1)
      redirect_to root_path, notice: "#{goal.title}を保留しました"
    else
      redirect_to root_path, notice: 'エラー：正しく処理されませんでした'
    end
  end

  def give_up
    goal = Goal.find(params[:goal_id])
    if goal.update(status: 3)
      redirect_to root_path, notice: "#{goal.title}を諦めました"
    else
      redirect_to root_path, notice: 'エラー：正しく処理されませんでした'
    end
  end

  private
    def goal_params
      params.require(:goal).permit(:title, :detail, :start, :end)
    end
end
