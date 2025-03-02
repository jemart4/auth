class ActivitiesController < ApplicationController

  def create
    if session["user_id"] != nil
    @activity = Activity.new
    @activity["contact_id"] = params["contact_id"]
    @activity["activity_type"] = params["activity_type"]
    #activity ["user_id"] = session["user_id"]
    @activity["note"] = params["note"]
    @activity.save
    end

    redirect_to "/contacts/#{@activity["contact_id"]}"
    
  end

end
