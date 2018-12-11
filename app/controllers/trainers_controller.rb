class TrainersController < ApplicationController
  def index
    @trainers = User.trainers.all.decorate
    render layout: false
  end
end
