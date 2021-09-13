class AttendsController < ApplicationController
  before_action :find_event
  before_action :find_attend, only: :destroy
  include AttendsHelper

  def create
    if already_attending?
      flash[:notice] = 'You are already attending this event.'
    else
      @event.attends.create(user_id: current_user.id)
    end

    redirect_to event_path(@event)
  end

  def destroy
    @attend.destroy if @event.user_id == current_user.id

    unless already_attending?
      flash[:notice] = 'You are already not attending this event.'
    else
      @attend.destroy
    end

    redirect_to event_path(@event)
  end

  private

  def find_event
    @event = Event.find(params[:event_id])
  end

  def find_attend
    @attend = @event.attends.find(params[:id])
  end
end
