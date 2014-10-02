class OfferingReport < ActiveRecord::Base
  has_many :offerings

  monetize :monthly_cents, :missions_cents, :thanksgiving_cents, :fundraising_cents, :new_year_cents, :christmas_cents, :other_cents, :total_cents
end
