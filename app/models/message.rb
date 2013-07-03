class Message < ActiveRecord::Base
  attr_accessible :content, :username
  validates :content, presence: true
  validates :username, presence: true
end
