class Vote < ApplicationRecord
  # relationship - link consists of multiple votes - composition
  belongs_to :link
end
