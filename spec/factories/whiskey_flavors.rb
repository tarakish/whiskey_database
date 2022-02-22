# == Schema Information
#
# Table name: whiskey_flavors
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  flavor_id  :bigint           not null
#  whiskey_id :bigint           not null
#
# Indexes
#
#  index_whiskey_flavors_on_flavor_id   (flavor_id)
#  index_whiskey_flavors_on_whiskey_id  (whiskey_id)
#
# Foreign Keys
#
#  fk_rails_...  (flavor_id => flavors.id)
#  fk_rails_...  (whiskey_id => whiskeys.id)
#
FactoryBot.define do
  factory :whiskey_flavor do
    whiskey { nil }
    flavor { nil }
  end
end
