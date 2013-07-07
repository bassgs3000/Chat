class Message < ActiveRecord::Base
  attr_accessible :content, :username, :identifier
  validates :content, presence: true
  validates :username, presence: true
  validates :identifier, presence: true
end
