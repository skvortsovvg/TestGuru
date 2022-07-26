class Badge < ApplicationRecord
  has_many :users_badges, dependent: :destroy
  has_many :users, through: :users_badges
  belongs_to :reward_rule

  def self.check_rewards(result, current_user)
    Badge.all.select do |badge|
      begin 
        leftv = eval(badge.reward_rule.leftValue);
        rightv = eval(badge.reward_rule.rightValue);
        current_user.badges << badge if eval("(#{leftv} #{badge.reward_rule.comparsion} #{rightv}) #{badge.reward_rule.additional}")
      rescue => detail
        false
      end
    end.map(&:title)
  end
end
