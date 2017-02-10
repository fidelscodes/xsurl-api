class LinksController < ApplicationController
  before_action :set_link, only: [:show]

  # GET /links
  def index
    @links = Link.all

    render json: @links
  end

  # GET /links/1
  def show
    if params[:random_hex_string]
      redirect_to @link.url
    else
      @link = Link.find_by(id: params[:id])
      render json: @link
    end
  end

  # POST /links
  def create
    @link = Link.new(link_params)
    if @link.save
      render json: @link, status: :created, location: @link
    else
      render json: @link.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /links/1
  # def update
  #   if @link.update(link_params)
  #     render json: @link
  #   else
  #     render json: @link.errors, status: :unprocessable_entity
  #   end
  # end

  # # DELETE /links/1
  # def destroy
  #   @link.destroy
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_link
      @link = Link.find_by(random_hex_string: params[:random_hex_string])
    end

    # Only allow a trusted parameter "white list" through.
    def link_params
      params.permit(:user_id, :url, :short_url, :random_hex_string, :description)
    end
end
