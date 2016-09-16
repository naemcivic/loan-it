class Api::V1::LoansController < ApplicationController
  respond_to :json
  skip_before_action :authenticate_user!
  before_action :set_device


  def create
    loan = @device.loans.build(loan_params)
    if loan.save
      render json: loan, status: 201, location: [:api, @device, loan]
    else
      render json: { errors: loan.errors }, status: 422
    end
  end




  private

    def loan_params
      params.require(:loan).permit(:signature, :user_id)
    end

    def set_device
      @device = Device.find(params[:device_id])
    end
end