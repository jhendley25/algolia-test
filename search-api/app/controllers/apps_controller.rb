class AppsController < ApplicationController
  before_action :set_app, only: [:show, :edit, :update, :destroy]

  # GET /apps
  # GET /apps.json
  def index
    @apps = App.all

    render :index
  end

  # GET /apps/1/edit
  def edit
  end

  # POST /apps
  # POST /apps.json
  def create
    @app = App.new(app_params)

    if @app.save
      render :show
    else
      head 422
    end
  end

  # DELETE /apps/1
  # DELETE /apps/1.json
  def destroy
    if @app.destroy
      head 200
    end

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_app
      @app = App.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def app_params
      params.require(:app).permit(:category, :rating, :name, :image, :link, :rating_count, :price)
    end
end
