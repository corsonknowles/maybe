# == Schema Information
#
# Table name: account_balances
#
#  id         :uuid             not null, primary key
#  account_id :uuid             not null
#  date       :date             not null
#  balance    :decimal(19, 4)   not null
#  currency   :string           default("USD"), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class AccountBalance < ApplicationRecord
  belongs_to :account

  validates :account, :date, :balance, presence: true

  scope :in_period, ->(period) { period.date_range.nil? ? all : where(date: period.date_range) }

  def self.to_series(account, period = Period.all)
    MoneySeries.new(
      in_period(period).order(:date),
      { trend_type: account.classification }
    )
  end
end
