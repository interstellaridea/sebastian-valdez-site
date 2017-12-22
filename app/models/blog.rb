class Blog < ApplicationRecord
	validates_presence_of :title

	enum status: { draft: 0, pending: 1, approved: 2, published: 3 }

  scope :pending_editor_approval, -> { where.not(status: [0,3]) } # only pending & approved blogs 
  
  scope :recent, -> { order(updated_at: :desc) }
end
