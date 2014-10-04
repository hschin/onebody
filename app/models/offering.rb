class Offering < ActiveRecord::Base
  belongs_to :person
  belongs_to :family
  belongs_to :offering_report

  monetize :amount_cents
end
