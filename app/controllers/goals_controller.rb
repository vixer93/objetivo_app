class GoalsController < ApplicationController
  def new
    @goal = Goal.new
  end

  def now
  end
end
