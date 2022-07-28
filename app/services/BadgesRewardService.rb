class BadgesRewardService

  def self.check_rewards(result, current_user)
    Badge.all.select do |badge|
      begin 
        left_value = eval(badge.reward_rule.left_value);
        right_value = eval(badge.reward_rule.right_value);
        current_user.badges << badge if eval("(#{left_value} #{badge.reward_rule.comparsion} #{right_value}) #{badge.reward_rule.additional}")
      rescue => detail
        false
      end
    end.map(&:title)
  end

end