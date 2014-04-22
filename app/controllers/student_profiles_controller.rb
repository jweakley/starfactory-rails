class StudentProfilesController < ApplicationController
  respond_to :html

  before_action :load_student_profile, only: [:show, :edit, :update, :destroy]
  before_action :add_student_profile_breadcrumbs

  # GET /students
  def index
    @student_profiles = StudentProfile.page params[:page]
    authorize @student_profiles
    respond_with @student_profiles
  end

  # GET /students/1
  def show
    add_breadcrumb @student_profile.name
    authorize @student_profile
    respond_with @student_profile
  end

  # GET /students/new
  def new
    @student_profile = policy_scope(StudentProfile).new
    add_breadcrumb 'New'
    authorize @student_profile
    respond_with @student_profile
  end

  # GET /students/1/edit
  def edit
    add_breadcrumb @student_profile.name, student_profile_url(@student_profile)
    add_breadcrumb 'Edit'
    authorize @student_profile
    respond_with @student_profile
  end

  # POST /students
  def create
    @student_profile = policy_scope(StudentProfile).new(student_profile_params)
    authorize @student_profile
    @student_profile.save
    respond_with @student_profile, location: @student_profile, error: 'Unable to add student.'
  end

  # PATCH/PUT /students/1
  def update
    @student_profile.update(student_profile_params)
    respond_with @student_profile, location: @student_profile, error: 'Unable to add student.'
  end

  # DELETE /students/1
  def destroy
    @student_profile.destroy
    respond_with @student_profile, location: @student_profile, error: 'Unable to remove student.'
  end

private
  def load_student_profile
    @student_profile = StudentProfile.find(params[:id])
    authorize @student_profile
  end

  def student_profile_params
    params.require(:student_profile).permit(
      *policy(@student_profile || StudentProfile).permitted_attributes
    )
  end

  def add_student_profile_breadcrumbs
    if logged_in? && current_user.admin?
      add_breadcrumb 'Students', :student_profiles_url
    else
      add_breadcrumb 'Students'
    end
  end
end
