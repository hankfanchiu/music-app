class Album < ActiveRecord::Base
  RECORDING_TYPE = %w(live studio)

  validates :name, :band_id, :recording_type, presence :true
  validates :recording_type, inclusion: RECORDING_TYPE

  belongs_to :band
  has_many :tracks, dependent: :destroy
end
