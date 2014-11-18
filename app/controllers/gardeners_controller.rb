class GardenersController < ApplicationController
   before_action :authenticate_user!

 # GET /gardeners/:gardener_id/gardeners
  # GET /gardeners/:gardener_id/gardeners.xml
  def index
    #1st you retrieve the gardener thanks to params[:gardener_id]
   @gardeners = current_user.gardeners

    respond_to do |format|
        format.html # index.html.erb
        format.xml {remder :xml => @gardeners}
  end
  end

  def show
@gardener = Gardener.includes(:gardeners).where(id: params[:id]).first!
    end

def new
    @gardener = Gardener.new
  end

 def create
    @gardener = Gardener.new(gardener_params)
    @gardener.user_id = current_user.id

      if @gardener.save
       redirect_to new_gardener_living_arrangement_path(@gardener)
      else
       render :new
      end
    end
  end
  # PATCH/PUT /gardeners/1
  # PATCH/PUT /gardeners/1.json
  def update
    @gardener = gardener.find(params[:id])
    respond_to do |format|
      if @gardener.update(gardener_params)
        redirect_to new_gardener_living_arrangements_path(@gardener)
      else
        format.html { render :edit }
        format.json { render json: @gardener.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gardeners/1
  # DELETE /gardeners/1.json
  def destroy
    @gardener = gardener.find(params[:id])
    @gardener.destroy
    respond_to do |format|
      format.html { redirect_to gardeners_url, notice: 'gardener was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.

    # Never trust parameters from the scary internet, only allow the white list through.
    def gardener_params
      params.require(:gardener).permit(:first_name, :last_name, :id_number, :user_id, :age, :gender)
    end
