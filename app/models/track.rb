class Track < ActiveRecord::Base
  TRACK_TYPE = %w(bonus regular)

  validates :name, :track_type, :album_id, presence: true
  validates :track_type, inclusion: TRACK_TYPE
end
