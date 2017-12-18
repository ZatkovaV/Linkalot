class StudyGroup < ApplicationRecord
  # relationship - one study group can have multiple links - aggregation in class diagram
  has_many :links
end
