# == Schema Information
#
# Table name: valuations
#
#  id         :uuid             not null, primary key
#  account_id :uuid             not null
#  date       :date             not null
#  value      :decimal(19, 4)   not null
#  currency   :string           default("USD"), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Valuation < ApplicationRecord
  belongs_to :account

  after_commit :sync_account

  scope :in_period, ->(period) { period.date_range.nil? ? all : where(date: period.date_range) }

  def self.to_series(account, period = Period.all)
    MoneySeries.new(
      in_period(period).order(:date),
      { trend_type: account.classification, amount_accessor: :value }
    )
  end

  private
    def sync_account
      self.account.sync_later
    end
end
