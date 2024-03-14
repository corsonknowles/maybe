# == Schema Information
#
# Table name: accounts
#
#  id                 :uuid             not null, primary key
#  subtype            :string
#  family_id          :uuid             not null
#  name               :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  accountable_type   :string
#  accountable_id     :uuid
#  balance            :decimal(19, 4)   default(0.0)
#  currency           :string           default("USD")
#  converted_balance  :decimal(19, 4)   default(0.0)
#  converted_currency :string           default("USD")
#  status             :string           default(NULL)
#  classification     :string
#  is_active          :boolean          default(TRUE), not null
#
class Credit < Account
end
