class MobileAppsController < ApplicationController
  before_action :set_app, only: [:show, :edit, :update, :destroy]

  # GET /apps
  # GET /apps.json
  def index
    @mobile_apps = MobileApp.all

    render :index
  end

  # GET /apps/1/edit
  def edit
  end

  # POST /apps
  # POST /apps.json
  def create
    @mobile_app = MobileApp.new(app_params)

    if @mobile_app.save
      render :show
    else
      head 422
    end
  end

  # DELETE /apps/1
  # DELETE /apps/1.json
  def destroy
    if @mobile_app.destroy
      head 200
    end

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_app
      @mobile_app = MobileApp.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def app_params
      params.require(:mobile_app).permit(:category, :rating, :name, :image, :link, :rating_count, :price)
    end
end
