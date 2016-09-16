class Api::V1::GroupsController < ApplicationController
	respond_to :json
  skip_before_action :authenticate_user!

  def index
    respond_with Group.all.pluck(:id, :name)
  end
end
