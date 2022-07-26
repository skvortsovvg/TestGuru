class Admin::BadgesController < Admin::BaseController
  before_action :set_badge, only: %i[edit update destroy]
  before_action :set_images, only: %i[new edit]

  def index
    @badges  = Badge.all
  end

  def new
    @badge = Badge.new
  end

  def edit
  end

  def show
  end

  def create
    @badge = Badge.new(badge_params)
    if @badge.save
      redirect_to admin_badges_path
    else
      set_images
      render :new
    end
  end

  def destroy
    @badge.destroy
    redirect_to admin_badges_path, notice: "Бейдж был удален"
  end


  private
  
  def set_images
    @images = Dir['app/assets/images/badges/*'].map { |img| img.gsub!('app/assets/images/', '') }
  end
  
  def set_badge
    @badge = Badge.find(params[:id])
  end
  
  def badge_params
    params.require(:badge).permit(:title, :image, :reward_rule_id)
  end
end
