class FollowUpVisitImpressionsController < ApplicationController
 
def new                                                   
  #1st you retrieve the group thanks to params[:group_id] 
  #2nd you build a new comment                            
  @group = Group.find(params[:group_id])                  
  @gardener= Gardener.find(params[:gardener_id])          
                                                          
  respond_to do |format|                                  
    format.html #new.html.erb                             
    format.xml {render :xml => @follow_up_visit_impression}                   
  end                                                     
end                                                       
 
# GET /groups/:group_id/gardeners/:id/edit
  def edit
    #1st you retrieve the group thanks to params[:group_id]
    group = Group.find(params[:group_id])
    #2nd you retrieve the comment thanks to params[:id]
    @gardener= group.gardeners.find(params[:gardener_id])
    @gardener.build_follow_up_visit_impression(follow_up_visit_impression_params)
  end
 
# POST /groups/:group_id/group_gardeners
# POST /groups/:group_id/group_gardeners.xml
 def create
    #1st you retrieve the group thanks to params[:group_id]
  group = Group.find(params[:group_id])
    #2nd you create the trainer wih arguments in params [:gardener]
  @gardener= group.gardeners.find(params[:gardener_id])
   @gardener.build_follow_up_visit_impression(follow_up_visit_impression_params)

    respond_to do |format|
     if @gardener.save

        #1st argument of redirect_to is an array, in order to build the correct route to the nested resource gardener
      format.html {redirect_to([@gardener.group, @group], :notice => 'Follow Up Visit completed successfully' )}
      format.xml {render :xml => @gardener, :status => :created, :location => [@gardener.group,@gardener] }
      else
        format.html {render :action => "new"}
        format.xml {render :xml => @gardener.errors, status: :unprocessable_entity}
      end
    end
  end

  def update
    #1st you retrieve the group thanks to params[:group_id]
    group = Group.find(params[:group_id])
    @gardener = group.gardeners.find(params[:id])
 
    respond_to do |format|
      if @gardener.update_attributes(follow_up_visit_impression_params)
        #1st argument of redirect_to is an array, in order to build the correct route to the nested resource gardener
     format.html {redirect_to([@gardener.group, @gardener], :notice => 'what what was successfully updated')}
     format.xml { head :ok}
      else
        format.html {render :action => "edit"}
        format.xml {render :xml => @gardener.errors, :status => :unprocessable_entity}
      end
    end
  end
  
  private
 
  def follow_up_visit_impression_params
    params.require(:follow_up_visit_impression).permit(:gardener_id, :future_plan, :issue, :positive, :negative, :general_comment)
  end

  def gardener_params
   params.require(:gardener).permit(:first_name, :last_name, :contact_number, :address, :group_id, :garden_at_home, :document, :id_number, :avatar)
  end
end
