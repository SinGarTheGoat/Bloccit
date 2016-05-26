class SponsoredPostController < ApplicationController
  def show
    @sponsoredpost = Sponsoredpost.all(params[:id])
  end

  def new
    @sponsoredpost = Sponsoredpost.find(params[:id]
    @sponsoredpost = sponsoredpost.new
  end

  def edit
    @sponsoredpost = Sponsoredpost.find(params[:id])
  end

end
