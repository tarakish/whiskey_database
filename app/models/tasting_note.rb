# == Schema Information
#
# Table name: tasting_notes
#
#  id           :bigint           not null, primary key
#  comment      :string           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  drink_way_id :bigint           not null
#  flavor_id    :bigint           not null
#  user_id      :bigint           not null
#  whiskey_id   :bigint           not null
#
# Indexes
#
#  index_tasting_notes_on_drink_way_id  (drink_way_id)
#  index_tasting_notes_on_flavor_id     (flavor_id)
#  index_tasting_notes_on_user_id       (user_id)
#  index_tasting_notes_on_whiskey_id    (whiskey_id)
#
# Foreign Keys
#
#  fk_rails_...  (drink_way_id => drink_ways.id)
#  fk_rails_...  (flavor_id => flavors.id)
#  fk_rails_...  (user_id => users.id)
#  fk_rails_...  (whiskey_id => whiskeys.id)
#
class TastingNote < ApplicationRecord
  belongs_to :user
  belongs_to :drink_way
  belongs_to :flavor

  validates :comment, presence: true
end
