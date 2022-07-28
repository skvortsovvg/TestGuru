class BadgesController < ApplicationController
  def my_badges
    # @badges = Badge.connection.select_all('Select COUNT(badges.id), title, image from badges group by badges.title, badges.image')
    @badges = current_user.badges.select('count(badges.id), badges.id, title, image').group(:id)
  end
end
