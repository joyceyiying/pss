class PssesController < ApplicationController
  before_action :set_pss, only: [:show, :edit, :update, :destroy]

  # GET /psses
  # GET /psses.json
  def index
    @psses = Pss.all
  end

  # GET /psses/1
  # GET /psses/1.json
  def show
  end

  # GET /psses/new
  def new
    @pss = Pss.new
  end

  # GET /psses/1/edit
  def edit
  end

  # POST /psses
  # POST /psses.json
  def create
    @pss = Pss.new(pss_params)

    respond_to do |format|
      if @pss.save
        format.html { redirect_to @pss, notice: 'Pss was successfully created.' }
        format.json { render :show, status: :created, location: @pss }
      else
        format.html { render :new }
        format.json { render json: @pss.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /psses/1
  # PATCH/PUT /psses/1.json
  def update
    respond_to do |format|
      if @pss.update(pss_params)
        format.html { redirect_to @pss, notice: 'Pss was successfully updated.' }
        format.json { render :show, status: :ok, location: @pss }
      else
        format.html { render :edit }
        format.json { render json: @pss.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /psses/1
  # DELETE /psses/1.json
  def destroy
    @pss.destroy
    respond_to do |format|
      format.html { redirect_to psses_url, notice: 'Pss was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pss
      @pss = Pss.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pss_params
      params.require(:pss).permit(:computer, :player, :win_lose)
    end
end
