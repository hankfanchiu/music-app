class Track < ActiveRecord::Base
  TRACK_TYPE = %w(bonus regular)

  validates :name, :track_type, :album_id, presence: true
  validates :track_type, inclusion: TRACK_TYPE

  belongs_to :album
  has_many :notes, dependent: :destroy
end
