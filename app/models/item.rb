class Item < ApplicationRecord
  acts_as_taggable_on :tags
  has_many_attached :demo_files
end
