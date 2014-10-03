require 'chronic'

class Administration::OfferingReportsController < ApplicationController

  before_filter :only_admins

  def index
    @offering_reports = OfferingReport.all
    @date = Chronic.parse('last sunday')
  end

  def new
    @offering_report = OfferingReport.new
    @offering_report.offerings.build
    @date = Chronic.parse('last sunday')
  end

  def create
    @offering_report = OfferingReport.new(offering_report_params)
    @offering_report.save
  end

  private

  def offering_report_params
    params.require(:offering_report).permit(:date, :monthly_cents, :missions_cents, :thanksgiving_cents, :fundraising_cents, :new_year_cents, :christmas_cents, :other_cents, :total_cents)
  end
end