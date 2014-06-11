class RegistrationsController < ApplicationController
  respond_to :html

  before_action :load_registration, only: [:show, :edit, :update, :destroy]
  before_action :load_event, only: [:show, :edit]
  before_action :add_breadcrumbs

  # GET /registrations/1
  # GET /registrations/1.json
  def show
    @page_title = 'Registration'
    add_breadcrumb 'Registration'
    authorize @registration
    respond_with @registration
  end

  # GET /registrations/1/edit
  def edit
    add_breadcrumb 'Edit Registration'
    authorize @registration
    respond_with @registration
  end

  # POST /registrations
  def create
    @registration = policy_scope(Registration).new(registration_params)
    authorize @registration
    if @registration.save ||
      (defined?(@registration.errors.messages[:student_profile_id]) &&
        @registration.errors.messages[:student_profile_id].first.match('taken'))
      flash[:notice] = 'Got it! Thanks for registering.'
    else
      flash[:error] = 'Unable to complete registration.'
    end
    redirect_to event_url(registration_params[:event_id])
  end

  # PATCH/PUT /registrations/1
  def update
    @registration.update(registration_params)
    respond_with @registration,
    location: @registration,
      error: 'Unable to update registration.'
  end

  # DELETE /registrations/1
  def destroy
    @registration.destroy
    respond_with @registration,
      location: @registration,
      error: 'Unable to remove registration.'
  end

private
  def load_registration
    @registration = Registration.find(params[:id])
  end

  def load_event
    @event = Event.find(params[:event_id])
  end

  def add_breadcrumbs
    add_breadcrumb 'Starfactory', root_url
    if logged_in? && current_user.admin?
      add_breadcrumb 'Admin', admin_url
      add_breadcrumb 'Registrations', admin_event_registrations_url(@event)
    else
      add_breadcrumb 'Events', events_url
      add_breadcrumb @event.workshop_name, event_url(@event) if defined?(@event)
    end
  end

  def registration_params
    params.require(:registration).permit(
      *policy(@registration || Registration).permitted_attributes
    )
  end
end
