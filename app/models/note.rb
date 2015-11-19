class Note < ActiveRecord::Base
  validates :text, :user_id, :track_id, presence: true
end
