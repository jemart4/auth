class TasksController < ApplicationController
  def index
    @tasks = Task.where({"user_id"=> session["user_id"]}) #only pulls tasks for that specific user
    #uses the cookie user_id to get that info, session incrypts that info
  end

  def create
    @task = Task.new
    @task["description"] = params["description"]
    @task["user_id"] = session["user_id"]
    @task.save
    redirect_to "/tasks"
  end

  def destroy
    @task = Task.find_by({ "id" => params["id"] })
      if @task["user_id"] == session["user_id"] #makes sure only user can delete their own entries
        @task.destroy
      end
    redirect_to "/tasks"
  end
end
