class Shout < ApplicationRecord
	
  belongs_to :user

  validates :body, presence: true, Length: { in: 1..144}
  validates :user, presence: true
end

