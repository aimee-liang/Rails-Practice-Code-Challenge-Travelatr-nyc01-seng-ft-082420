class Post < ApplicationRecord
    belongs_to :bloggers
    belongs_to :destinations

    validates :title, presence: true
    validates :content, length: {minimum: 101}
end
