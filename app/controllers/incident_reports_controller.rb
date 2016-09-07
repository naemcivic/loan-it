class IncidentReportsController < ApplicationController
  before_action :set_incident_report, only: [:show, :edit, :update, :destroy]

  # GET /incident_reports
  # GET /incident_reports.json
  def index
    @incident_reports = IncidentReport.all
  end

  # GET /incident_reports/1
  # GET /incident_reports/1.json
  def show
  end

  # GET /incident_reports/new
  def new
    @incident_report = IncidentReport.new
  end

  # GET /incident_reports/1/edit
  def edit
  end

  # POST /incident_reports
  # POST /incident_reports.json
  def create
    @incident_report = IncidentReport.new(incident_report_params)

    respond_to do |format|
      if @incident_report.save
        format.html { redirect_to @incident_report, notice: 'Incident report was successfully created.' }
        format.json { render :show, status: :created, location: @incident_report }
      else
        format.html { render :new }
        format.json { render json: @incident_report.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /incident_reports/1
  # PATCH/PUT /incident_reports/1.json
  def update
    respond_to do |format|
      if @incident_report.update(incident_report_params)
        format.html { redirect_to @incident_report, notice: 'Incident report was successfully updated.' }
        format.json { render :show, status: :ok, location: @incident_report }
      else
        format.html { render :edit }
        format.json { render json: @incident_report.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /incident_reports/1
  # DELETE /incident_reports/1.json
  def destroy
    @incident_report.destroy
    respond_to do |format|
      format.html { redirect_to incident_reports_url, notice: 'Incident report was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_incident_report
      @incident_report = IncidentReport.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def incident_report_params
      params.require(:incident_report).permit(:description, :useable)
    end
end
