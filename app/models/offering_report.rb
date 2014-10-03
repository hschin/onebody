class OfferingReport < ActiveRecord::Base
  has_many :offerings

  accepts_nested_attributes_for :offerings, allow_destroy: true, reject_if: lambda { |a| a[:name].blank? }

  monetize :monthly_cents, :missions_cents, :thanksgiving_cents, :fundraising_cents, :new_year_cents, :christmas_cents, :other_cents, :total_cents

  validates_uniqueness_of :report_date
end
