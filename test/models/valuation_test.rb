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
require "test_helper"

class ValuationTest < ActiveSupport::TestCase
end
