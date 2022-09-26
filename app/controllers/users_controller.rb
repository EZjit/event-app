class UsersController < ApplicationController
  before_action :set_user, :see_attended_events, :see_created_events

  def profile
    @user = current_user
  end

  def show; end

  private

  def see_created_events
    @created_events = @user.created_events.order(event_date: :desc)
  end

  def see_attended_events
    @attended_events = @user.attended_events.order(event_date: :desc)
  end

  def set_user
    @user = User.find(params[:format])
  end
end
