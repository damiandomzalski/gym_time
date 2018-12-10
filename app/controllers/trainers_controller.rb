class TrainersController < ApplicationController
  def index
    @trainers = User.trainers.all
    render layout: false
  end
end
