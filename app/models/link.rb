class Link < ActiveRecord::Base
  belongs_to :user

  validates :title, presence: true
  validates_url :url, presence: true
end
