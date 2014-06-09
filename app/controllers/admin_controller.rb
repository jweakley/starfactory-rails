class AdminController < ApplicationController
  respond_to :html
  add_breadcrumb 'Admin', :admin_url

  def index
  end

  def events
    add_breadcrumb 'Events'
    @events = Event.by_soonest.page params[:page]
    authorize @events
    respond_with @events
  end

  def instructors
    add_breadcrumb 'Instructors'
    @instructor_profiles = InstructorProfile.by_name.page params[:page]
    authorize @instructor_profiles
    respond_with @instructor_profiles
  end

  def students
    add_breadcrumb 'Students'
    @student_profiles = StudentProfile.by_name.page params[:page]
    authorize @student_profiles
    respond_with @student_profiles
  end

  def tracks
    add_breadcrumb 'Tracks'
    @tracks = Track.by_name.page params[:page]
    authorize @tracks
    respond_with @tracks
  end

  def workshops
    add_breadcrumb 'Workshops'
    @workshops = Workshop.by_name.page params[:page]
    authorize @workshops
    respond_with @workshops
  end
end
