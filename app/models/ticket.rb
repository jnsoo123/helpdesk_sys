class Ticket < ApplicationRecord
  belongs_to :user

  has_many :comments

  validates :status, inclusion: { in: Tickets::Statuses::ALL }
end
