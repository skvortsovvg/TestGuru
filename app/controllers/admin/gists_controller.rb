class Admin::GistsController < Admin::BaseController
  def index
    @gists = Gist.all.order(:created_at)
  end
end
