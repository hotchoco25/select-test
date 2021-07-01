class Topic < ApplicationRecord
  with_options presence: true do
    validates :topic_name
    validates :creator
  end

  belongs_to :user
end
