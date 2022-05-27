# == Schema Information
#
# Table name: bookmarks
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#  whiskey_id :bigint           not null
#
# Indexes
#
#  index_bookmarks_on_user_id     (user_id)
#  index_bookmarks_on_whiskey_id  (whiskey_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#  fk_rails_...  (whiskey_id => whiskeys.id)
#
class Bookmark < ApplicationRecord
  belongs_to :user
  belongs_to :whiskey

  validates :whiskey_id, uniqueness: { scope: :user_id }
end
