class LivingArrangementsController < ApplicationController
 before_action :authenticate_user!

  def new                                                   
  #1st you retrieve the group thanks to params[:group_id] 
  #2nd you build a new comment                                            
  @gardener= Gardener.find(params[:gardener_id])
  @living_arrangement= LivingArrangement.new                                                                                 
  end                                                      
 
# GET /groups/:group_id/gardeners/:id/edit
  def edit
    #1st you retrieve the group thanks to params[:group_id]
    #2nd you retrieve the comment thanks to params[:id]
    @gardener= Gardener.find(params[:gardener_id])
    @living_arrangement= @gardener.build_living_arrangement
    @living_arrangement = @gardener.build_living_arrangement
    @gardener.build_living_arrangement
  end
 
# POST /groups/:group_id/group_gardeners
# POST /groups/:group_id/group_gardeners.xml
  def create
    #1st you retrieve the group thanks to params[:group_id]
    #2nd you create the trainer wih arguments in params [:gardener]
   @gardener= Gardener.find(params[:gardener_id])
   @living_arrangement = @gardener.build_living_arrangement living_arrangement_params
    if @living_arrangement.save
        redirect_to new_gardener_farming_resource_path(@gardener)
        #render "living_arrangements/new", id:@gardener 
       else
          render :new
        end
     end
  end
 
  def update
    #1st you retrieve the group thanks to params[:group_id]
    @gardener= Gardener.find(params[:gardener_id])
    @living_arrangement= @gardener.build_living_arrangement
    @living_arrangement = @gardener.build_living_arrangement
    @gardener.build_living_arrangement
     if @living_arrangement.save
        redirect_to new_gardener_farming_resource_path(@gardener)
        else
         render :edit
        end
      end

  private
 
  def living_arrangement_params
    params.require(:living_arrangement).permit(:relationship_to_hh, :number_of_people_in_household, :number_of_people_in_household_adults, :number_of_people_in_household_children, :housing_type, :location)
  end


        
        #render "living_arrangements/new", id:@gardener 