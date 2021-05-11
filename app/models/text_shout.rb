class TextShout < ApplicationRecord
	validates :body, presence: true, Length: { in: 1..144}
end
