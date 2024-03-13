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
require "test_helper"

class TransactionTest < ActiveSupport::TestCase
end
