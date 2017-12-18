class Link < ApplicationRecord
  # relationship - link consists of many votes - composition in class diagram
  has_many :votes

  # relationship - every link belongs to a certain study group - aggregation in class diagram
  belongs_to :study_group
end
