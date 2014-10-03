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
    @offering_report.monthly_cents = 0
    @offering_report.missions_cents = 0
    @offering_report.thanksgiving_cents = 0
    @offering_report.fundraising_cents = 0
    @offering_report.new_year_cents = 0
    @offering_report.christmas_cents = 0
    @offering_report.other_cents = 0
    @offering_report.total_cents = 0
    @offering_report.save!
  end

  private

  def offering_report_params
    params.require(:offering_report).permit(:report_date, :monthly_cents, :missions_cents, :thanksgiving_cents, :fundraising_cents, :new_year_cents, :christmas_cents, :other_cents, :total_cents,
      offerings_attributes: [:id, :date, :person_id, :family_id, :offering_type, :name, :amount_cents, :amount_currency, :offering_report_id]
      )
  end
end