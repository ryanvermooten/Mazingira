class FarmingResourcesController < ApplicationController
 before_action :authenticate_user!

  def new                                                   
  #1st you retrieve the group thanks to params[:group_id] 
  #2nd you build a new comment                                            
  @gardener= Gardener.find(params[:gardener_id])
  @farming_resource= FarmingResource.new                                                                                 
  end                                                      
 
# GET /groups/:group_id/gardeners/:id/edit
  def edit
    #1st you retrieve the group thanks to params[:group_id]
    #2nd you retrieve the comment thanks to params[:id]
    @gardener= Gardener.find(params[:gardener_id])
    @farming_resource= @gardener.build_farming_resource
    @farming_resource = @gardener.build_farming_resource
    @gardener.build_farming_resource
  end
 
# POST /groups/:group_id/group_gardeners
# POST /groups/:group_id/group_gardeners.xml
  def create
    #1st you retrieve the group thanks to params[:group_id]
    #2nd you create the trainer wih arguments in params [:gardener]
   @gardener= Gardener.find(params[:gardener_id])
   @farming_resource = @gardener.build_farming_resource farming_resource_params
    if @farming_resource.save
        redirect_to gardeners_path
        #render "farming_resources/new", id:@gardener 
       else
          render :new
        end
     end
  end
 
  def update
    #1st you retrieve the group thanks to params[:group_id]
    @gardener= Gardener.find(params[:gardener_id])
    @farming_resource= @gardener.build_farming_resource
    @farming_resource = @gardener.build_farming_resource
    @gardener.build_farming_resource
     if @farming_resource.save
        redirect_to new_gardener_farming_resource_path(@gardener)
        else
         render :edit
        end
      end

  private
 
  def farming_resource_params
    params.require(:farming_resource).permit(:number_of_people_engaged_in_farming, :number_of_farming_spaces, :type_of_farming_space, :size_of_farming_space, :financial_capital_for_farming, :gardener_id)
  end


        
        #render "farming_resources/new", id:@gardener 