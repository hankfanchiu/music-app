class Album < ActiveRecord::Base
  validates :name, presence :true
end
