class TestController < ApplicationController

  def new
  end

  def create
    cooling =  params[:session][:check_cooling]
    tire =  params[:session][:check_tire]
    engine =  params[:session][:check_engine]
    current_vehicle_id = session[:current_vehicle_id] = params[:session][:vehicle_id]
    if cooling =="1" and tire =="1" and engine=="1" and (current_vehicle_id != 'Enter a Vehicle ID' and current_vehicle_id != '')
        redirect_to current_user
    else
        flash[:error] = 'Unsuccessful in checking-in becuase not all the checkboxes were checked or vehicle id not entered!'
        redirect_to checklist_path
    end 
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end