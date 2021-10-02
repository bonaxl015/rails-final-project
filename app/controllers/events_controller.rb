class EventsController < ApplicationController
  load_and_authorize_resource except: %i[index]
  before_action :authenticate_user!
  before_action :set_event, only: %i[edit update destroy]

  def index
    @user_events = Event.where(user_id: current_user).order(created_at: :desc)
    @events = Event.all.includes(:user).order(created_at: :desc)
  end

  def new
    @event = Event.new

    respond_to do |format|
      format.html
      format.js
    end
  end

  def edit
    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    @event = Event.new(event_params.merge(user_id: current_user.id))

    respond_to do |format|
      if @event.save
        format.html { redirect_to events_path, notice: 'Event was successfully created.' }
      else
        format.html { redirect_to events_path, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to events_path, notice: 'Event was successfully updated.' }
      else
        format.html { redirect_to events_path, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @event.destroy

    respond_to do |format|
      format.html { redirect_to events_path, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:name, :description, :start_date, :end_date)
  end
end
