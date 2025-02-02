class OffersController < ApplicationController
  before_action :set_offer, only: [:show, :update, :destroy]

  # GET /offers
  def index
    @offers = Offer.filter(filter_params)
    @offers = @offers.order(price_with_discount: order) if @offers.present?

    render json: JSON.pretty_generate(@offers.as_json)
  end

  # GET /offers/1
  def show
    render json: JSON.pretty_generate(OfferSerializer.new(@offer).as_json)
  end

  # POST /offers
  def create
    @offer = Offer.new(offer_params)

    if @offer.save
      render json: @offer, status: :created, location: @offer
    else
      render json: @offer.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /offers/1
  def update
    if @offer.update(offer_params)
      render json: @offer
    else
      render json: @offer.errors, status: :unprocessable_entity
    end
  end

  # DELETE /offers/1
  def destroy
    @offer.destroy
  end

  private
    def filter_params
      params.permit(:course_name, :course_kind, :course_shift, :course_level, :university_name, :city)
    end

    def order
      if params[:order].present? && %w(asc desc).include?(params[:order])
        params[:order]
      else
        'asc'
      end
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_offer
      @offer = Offer.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def offer_params
      params.require(:offer).permit(:full_price, :discount_percentage, :start_date, :enrollment_semester, :course_id, :university_id, :campus_id)
    end
end
