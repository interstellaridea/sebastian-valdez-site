class Blog < ApplicationRecord
	validates_presence_of :title

	enum status: { draft: 0, pending: 1, approved: 2, published: 3 }
end
