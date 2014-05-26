class StaticController < ApplicationController
  def index
    @active_events = Event.active.page.per 3
    @voted_workshops = Workshop.voted.page.per 3
  end

  def status403
    add_breadcrumb 'Status 403'
  end

  def status404
    add_breadcrumb 'Status 404'
  end

  def status500
    add_breadcrumb 'Status 500'
  end
end
