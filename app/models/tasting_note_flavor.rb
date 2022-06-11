# == Schema Information
#
# Table name: tasting_note_flavors
#
#  id              :bigint           not null, primary key
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  flavor_id       :bigint           not null
#  tasting_note_id :bigint           not null
#
# Indexes
#
#  index_tasting_note_flavors_on_flavor_id        (flavor_id)
#  index_tasting_note_flavors_on_tasting_note_id  (tasting_note_id)
#
# Foreign Keys
#
#  fk_rails_...  (flavor_id => flavors.id)
#  fk_rails_...  (tasting_note_id => tasting_notes.id)
#
class TastingNoteFlavor < ApplicationRecord
  belongs_to :tasting_note
  belongs_to :flavor

  validates :tasting_note_id, uniqueness: { scope: :flavor_id }
end
