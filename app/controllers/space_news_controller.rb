require 'space_flight'
require 'will_paginate/array'

class SpaceNewsController < ApplicationController
  before_action :authenticate_user!
  include SpaceNewsHelper

  def index
    data = SpaceFlight.new.article_limit(240).body
    @news = parse(data).paginate(page: params[:page], per_page: 12)
  end

  def search
    return unless params[:title]

    data = SpaceFlight.new.article_search(params[:title]).body
    @news = parse(data).paginate(page: params[:page], per_page: 12)
    render(action: :index)
  end
end
