# == Schema Information
#
# Table name: transactions
#
#  id          :uuid             not null, primary key
#  name        :string
#  date        :date             not null
#  amount      :decimal(19, 4)   not null
#  currency    :string           default("USD"), not null
#  account_id  :uuid             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :uuid
#
class Transaction < ApplicationRecord
  belongs_to :account
  belongs_to :category, optional: true

  validates :name, :date, :amount, :account, presence: true

  after_commit :sync_account

  def self.ransackable_attributes(auth_object = nil)
    %w[name amount date]
  end

  def self.ransackable_associations(auth_object = nil)
    %w[category account]
  end

  private

    def sync_account
      self.account.sync_later
    end
end
