class Chatroom < ActiveRecord::Base
  attr_accessible :identifier, :name, :private, :created_by
  validate :add_username_to_private_identifier, before: :create
  validate :ensure_no_whitespaces, before: :create
  

  validates :name, presence: true
  validates :identifier, presence: true, uniqueness: true, length: { maximum: 50 }

  private
    def ensure_no_whitespaces
      self.identifier = self.identifier.gsub(/\W+/,"_")
    end
    def add_username_to_private_identifier
      if self.private
        self.identifier = self.identifier + User.find_by_id(self.created_by).username
      end
    end
end
