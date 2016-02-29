class Ad < ActiveRecord::Base
  validates :name, presence: true
end
