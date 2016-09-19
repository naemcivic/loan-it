class Api::V1::LoansController < ApplicationController
  respond_to :json
  skip_before_action :authenticate_user!
  before_action :set_device
  before_action :set_loan, only: [:update, :destroy]

  def create
    loan = @device.loans.build(loan_params)
    if loan.save
      render json: loan, status: 201, location: [:api, @device, loan]
    else
      render json: { errors: loan.errors }, status: 422
    end
  end

  def update
    if @loan.update(loan_params)
      render json: @loan, status: 201, location: [:api, @device, @loan]
    else
      render json: { errors: @loan.errors }, status: 422
    end
  end

  def destroy
	  @loan.update(active: false)
  end

  private

    def loan_params
      params.require(:loan).permit(:signature, :user_id)
    end

    def set_device
      @device = Device.find(params[:device_id])
    end

    def set_loan
      @loan = Loan.find(params[:id])
    end
end