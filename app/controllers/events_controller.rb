class EventsController < ApplicationController
  respond_to :html

  before_action :load_event, only: [:show, :edit, :update, :destroy]

  add_breadcrumb 'Events', :events_url

  # GET /events
  def index
    @page_title = 'Events'
    @events = Event.current.by_soonest.page params[:page]
    authorize @events
    respond_with @events
  end

  # GET /events/1
  def show
    @page_title = @event.name
    add_breadcrumb @event.name
    authorize @event
    respond_with @event
  end

  # GET /events/new
  def new
    @event = policy_scope(Event).new
    add_breadcrumb 'New'
    authorize @event
    respond_with @event
  end

  # GET /events/1/edit
  def edit
    add_breadcrumb @event.name, event_url(@event)
    add_breadcrumb 'Edit'
    authorize @event
    respond_with @event
  end

  # POST /events
  def create
    @event = policy_scope(Event).new(event_params)
    authorize @event
    @event.save
    respond_with @event, location: @event, error: 'Unable to add event.'
  end

  # PATCH/PUT /events/1
  def update
    @event.update(event_params)
    respond_with @event, location: @event, error: 'Unable to add event.'
  end

  # DELETE /events/1
  def destroy
    @event.destroy
    respond_with @event, location: @event, error: 'Unable to remove event.'
  end

private
  def load_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(
      *policy(@event || event).permitted_attributes
    )
  end
end
