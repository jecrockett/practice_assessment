class LinksController < ApplicationController
  before_action :authenticate!, only: [:index]

  def index
    @new_link = Link.new
    @links = current_user.links
  end

  def create
    @link = Link.new(link_params)
    if @link.save
      @link.user_id = current_user.id
      @link.save
      flash[:notice] = "#{@link.title} was created!"
      redirect_to links_path
    else
      flash.now[:error] = "Missing fields or invalid URL."
      render :index
    end
  end

  private

  def link_params
    params.require(:link).permit(:title, :url)
  end

end
