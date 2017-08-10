class SourceProvider < ApplicationRecord
  validates :name, uniqueness: true, presence: true
  validates :url,  uniqueness: true, presence: true
  validates :address, presence: true
end
