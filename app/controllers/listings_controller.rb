class ListingsController < ApplicationController
  helper_method :owned

  def index
    @listings = Listing.all
  end

  def owned(listing)
    current_user.id == listing.user_id
  end

  def show
    @listing = Listing.find(params[:id])
    @user = User.find(Listing.find(params[:id]).user_id)
    #@user = User.find(4)
  end

  def new
    @listing = Listing.new
  end

  def create
    @listing = Listing.new
    @listing.user_id = params[:user_id]
    @listing.city = params[:city]
    @listing.address = params[:address]
    @listing.rent_dates = params[:rent_dates]
    @listing.rent_amount = params[:rent_amount]
    @listing.details = params[:details]

    if @listing.save
      redirect_to "/listings", :notice => "Listing created successfully."
    else
      render 'new'
    end

  end

  def edit
    @listing = Listing.find(params[:id])
  end

  def update
    @listing = Listing.find(params[:id])
    @listing.user_id = params[:user_id]
    @listing.city = params[:city]
    @listing.address = params[:address]
    @listing.rent_dates = params[:rent_dates]
    @listing.rent_amount = params[:rent_amount]
    @listing.details = params[:details]

    if @listing.save
      redirect_to "/listings", :notice => "Listing updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @listing = Listing.find(params[:id])

    @listing.destroy

    redirect_to "/listings", :notice => "Listing deleted."
  end
end
