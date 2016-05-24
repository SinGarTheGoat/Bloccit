class AdvertisementsController < ApplicationController
  def index
    @advertisements = Advertisement.all
  end

  def show
    #unsure about this line
    @advertisement = Advertisement.find(params[:id])
  end

  def new
      @advertisement =   Advertisement.new

  end

  def create
    @advertisement = Advertisement.new
    @advertisement.title = params[:advertisement][:title]
    @advertisement.copy = params[:advertisement][:copy]
    @advertisement.price = params[:advertisement][:price]

#10
   if @advertisement.save
#11
      flash[:notice] = "advertisement was saved successfully."
      redirect_to @advertisement
    else
# #12
      flash[:alert] = "There was an error saving the advertisement. Please try again."
      render :new
   end
  end
end
