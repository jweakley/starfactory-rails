class TracksController < ApplicationController
  respond_to :html

  before_action :load_track, only: [:show, :edit, :update, :destroy]

  add_breadcrumb 'Tracks', :tracks_url

  # GET /tracks
  def index
    if logged_in? && current_user.admin?
      @tracks = Track.page params[:page]
    else
      @tracks = Track.active.page params[:page]
    end
    authorize @tracks
    respond_with @tracks
  end

  # GET /tracks/1
  def show
    add_breadcrumb @track.name
    authorize @track
    respond_with @track
  end

  # GET /tracks/new
  def new
    @track = policy_scope(Track).new
    add_breadcrumb 'New'
    authorize @track
    respond_with @track
  end

  # GET /tracks/1/edit
  def edit
    add_breadcrumb @track.name, track_url(@track)
    add_breadcrumb 'Edit'
    authorize @track
    respond_with @track
  end

  # POST /tracks
  def create
    @track = policy_scope(Track).new(track_params)
    authorize @track
    @track.save
    respond_with @track, location: @track, error: 'Unable to add track.'
  end

  # PATCH/PUT /tracks/1
  def update
    @track.update(track_params)
    respond_with @track, location: @track, error: 'Unable to add track.'
  end

  # DELETE /tracks/1
  def destroy
    @track.destroy
    respond_with @track, location: @track, error: 'Unable to remove track.'
  end

private
  def load_track
    @track = Track.find(params[:id])
  end

  def track_params
    params.require(:track).permit(
      *policy(@track || Track).permitted_attributes
    )
  end
end
