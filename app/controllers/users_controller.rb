class UsersController < ApplicationController # rubocop:todo Layout/EndOfLine
  before_action :authenticate_user!, except: :index

  def index; end
end
