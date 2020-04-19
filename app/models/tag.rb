class Tag < ApplicationRecord
  belongs_to :tweet, optional: true
end
