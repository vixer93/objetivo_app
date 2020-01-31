module CommonModule
  extend ActiveSupport::Concern

  #呼び出しインスタンスがGoalの場合とStageの場合で条件分岐
  #Rubyでは整数同士の除算で出る小数は切り捨てられるため、float型へ変換して計算
  def progress_rate
    if self.instance_of?(Goal)
      return nil if self.stages.count == 0
      rate = self.stages.where(status: true).count / self.stages.count.to_f
    else
      return nil if self.todos.count == 0
      rate = self.todos.where(status: true).count / self.todos.count.to_f
    end
    (rate*100).to_i.round
  end

end