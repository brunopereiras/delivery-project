class EstablishmentsController < ApplicationController
  before_action :set_establishment, only: [:show, :edit, :update, :destroy]
  before_action :user_logged_in?, only: [:index, :new, :create, :edit, :update, :destroy]

  before_action :show_pede_pizza_menu, if: :user_is_establishment?
  before_action :show_menu, only: [:show]

  layout 'establishment', only: [:show]

  include EstablishmentsHelper

  # GET /establishments
  # GET /
  def index
    @establishments = current_user.establishments
  end

  # GET /establishments/1
  # GET /establishments/1.json
  def show
    @product_categories = @establishment.product_categories.order('created_at DESC')
  end

  # GET /establishments/new
  def new
    @establishment = Establishment.new
  end

  # GET /establishments/1/edit
  def edit
  end

  # POST /establishments
  # POST /establishments.json
  def create
    @establishment = Establishment.new(establishment_params)
    @establishment.user = current_user

    respond_to do |format|
      if @establishment.save
        format.html { redirect_to @establishment, notice: 'Establishment was successfully created.' }
        format.json { render :show, status: :created, location: @establishment }
      else
        format.html { render :new }
        format.json { render json: @establishment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /establishments/1
  # PATCH/PUT /establishments/1.json
  def update
    respond_to do |format|
      if @establishment.update(establishment_params)
        format.html { redirect_to @establishment, notice: 'Establishment was successfully updated.' }
        format.json { render :show, status: :ok, location: @establishment }
      else
        format.html { render :edit }
        format.json { render json: @establishment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /establishments/1
  # DELETE /establishments/1.json
  def destroy
    @establishment.destroy
    respond_to do |format|
      format.html { redirect_to establishments_url, notice: 'Establishment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_establishment
      @establishment = Establishment.where('id = ? and user_id = ?', params[:id], current_user.id).take
      save_establishment(@establishment)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def establishment_params
      params.require(:establishment).permit(:name)
    end
end
