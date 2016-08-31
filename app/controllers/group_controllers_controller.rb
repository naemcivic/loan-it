class GroupControllersController < ApplicationController
  before_action :set_group_controller, only: [:show, :edit, :update, :destroy]

  # GET /group_controllers
  # GET /group_controllers.json
  def index
    @group_controllers = GroupController.all
  end

  # GET /group_controllers/1
  # GET /group_controllers/1.json
  def show
  end

  # GET /group_controllers/new
  def new
    @group_controller = GroupController.new
  end

  # GET /group_controllers/1/edit
  def edit
  end

  # POST /group_controllers
  # POST /group_controllers.json
  def create
    @group_controller = GroupController.new(group_controller_params)

    respond_to do |format|
      if @group_controller.save
        format.html { redirect_to @group_controller, notice: 'Group controller was successfully created.' }
        format.json { render :show, status: :created, location: @group_controller }
      else
        format.html { render :new }
        format.json { render json: @group_controller.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /group_controllers/1
  # PATCH/PUT /group_controllers/1.json
  def update
    respond_to do |format|
      if @group_controller.update(group_controller_params)
        format.html { redirect_to @group_controller, notice: 'Group controller was successfully updated.' }
        format.json { render :show, status: :ok, location: @group_controller }
      else
        format.html { render :edit }
        format.json { render json: @group_controller.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /group_controllers/1
  # DELETE /group_controllers/1.json
  def destroy
    @group_controller.destroy
    respond_to do |format|
      format.html { redirect_to group_controllers_url, notice: 'Group controller was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group_controller
      @group_controller = GroupController.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def group_controller_params
      params.fetch(:group_controller, {})
    end
end
