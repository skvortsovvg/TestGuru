class Admin::RewardRulesController < Admin::BaseController
  before_action :set_rule, only: %i[show edit update]

  def new
    @rule = RewardRule.new
  end

  def edit
  end

  def index
    @rules = RewardRule.all
  end

  def create
    @rule = RewardRule.new(rule_params)
    if @rule.save
      redirect_to admin_reward_rules_path
    else
      render :new
    end
  end

  def update
    if @rule.update(rule_params)
      redirect_to admin_reward_rules_path
    else
      render :edit
    end
  end

  private

  def set_rule
    @rule = RewardRule.find(params[:id])
  end
  
  def rule_params
    params.require(:reward_rule).permit(:title, :leftValue, :comparsion, :rightValue, :additional)
  end
end
