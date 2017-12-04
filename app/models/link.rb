class Link < ApplicationRecord
  has_many :votes
  belongs_to :study_group
end
