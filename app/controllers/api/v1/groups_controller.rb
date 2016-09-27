class Api::V1::GroupsController < ApplicationController
	respond_to :json
  skip_before_action :authenticate_user!

  def index
    respond_with Group.all.as_json(only: [:id, :name], include: {devices: {only: [:id, :name], methods: [:working_device_name, :broken_device_name]}})
  end
end
