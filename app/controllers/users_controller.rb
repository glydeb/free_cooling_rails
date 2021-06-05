class UsersController < ApplicationController
  def show
    @phones = current_user.phones
    @sensors = current_user.indoor_sensors
  end
end
