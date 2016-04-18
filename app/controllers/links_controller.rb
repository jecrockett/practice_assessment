class LinksController < ApplicationController
  before_action :authenticate!, only: [:index]

  def index
  end

end
