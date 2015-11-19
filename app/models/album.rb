class Album < ActiveRecord::Base
  RECORDING_TYPE = %w(live studio)

  validates :name, :band_id, :recording_type, presence :true
  validates :recording_type, inclusion: RECORDING_TYPE
end
