class AttendsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_event
  before_action :find_attend, only: :destroy
  include AttendsHelper
  include EventsHelper

  def create
    return if event_ended?(@event)

    if already_attending?
      flash[:notice] = 'You are already attending this event.'
    else
      @event.attends.create(user_id: current_user.id)
    end

    respond_to do |format|
      format.html { redirect_back(fallback_location: events_path) }
      format.js
    end
  end

  def destroy
    return if event_ended?(@event)

    @attend.destroy if @event.user_id == current_user.id

    if already_attending?
      @attend.destroy
    else
      flash[:notice] = 'You are already not attending this event.'
    end

    respond_to do |format|
      format.html { redirect_back(fallback_location: events_path) }
      format.js
    end
  end

  private

  def find_event
    @event = Event.find(params[:event_id])
  end

  def find_attend
    @attend = @event.attends.find(params[:id])
  end
end
