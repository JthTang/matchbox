class BookingsController < ApplicationController
  def index
    @bookings = policy_scope(Booking).order(created_at: :desc)
    @user = current_user
    @path = ''
  end

  def new

  end

  def create

  end
end
