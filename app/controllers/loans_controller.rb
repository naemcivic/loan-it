class LoansController < ApplicationController
  before_action :set_device
  before_action :set_loan, only: [:show, :edit, :update, :destroy]

  # GET /loans
  # GET /loans.json
  def index
    @loans = @device.loans
  end

  # GET /loans/1
  # GET /loans/1.json
  def show
  end

  # GET /loans/new
  def new
    @loan = Loan.new(:device_id => params[:device_id])
  end

  # GET /loans/1/edit
  def edit
  end

  # POST /loans
  # POST /loans.json
  def create
    #@loan = Loan.new(loan_params)
    @loan = @device.loans.build(loan_params)

    # instructions = JSON.parse(params[:output]).map { |h| "line #{h['mx'].to_i},#{h['my'].to_i} #{h['lx'].to_i},#{h['ly'].to_i}" } * ' '
    # tempfile = Tempfile.new(["signature", '.png'])
    # Open3.popen3("convert -size 600x100 xc:transparent -stroke blue -draw @- #{tempfile.path}") do |input, output, error|
    #   input.puts instructions
    # end
    # @yourmodel.signature = tempfile

    respond_to do |format|
      if @loan.save
        format.html { redirect_to device_loans_url, notice: 'Loan was successfully created.' }
        format.json { render :show, status: :created, location: @loan }
      else
        format.html { render :new }
        format.json { render json: @loan.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /loans/1
  # PATCH/PUT /loans/1.json
  def update
    respond_to do |format|
      if @loan.update(loan_params)
        format.html { redirect_to device_loans_url, notice: 'Loan was successfully updated.' }
        format.json { render :show, status: :ok, location: @loan }
      else
        format.html { render :edit }
        format.json { render json: @loan.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /loans/1
  # DELETE /loans/1.json
  def destroy
    @loan.update(active: false)
    respond_to do |format|
      format.html { redirect_to device_loans_url, notice: 'Device was relinquished.' }
      format.json { head :no_content  }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_loan
      @loan = Loan.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def loan_params
      params.require(:loan).permit(:signature, :user_id)
    end

    def set_device
      @device = Device.find(params[:device_id])
    end
end
