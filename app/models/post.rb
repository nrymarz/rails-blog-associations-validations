class Post < ActiveRecord::Base
    belongs_to :user
    has_many :post_tags
    has_many :tags, through: :post_tags
    accepts_nested_attributes_for :tags

    validates :name, presence: true
    validates :content, presence: true

    def tag_attributes=(tag_attributes)
        if !tag_attributes[:name].empty?
            tag = Tag.find_or_create_by(name: tag_attributes[:name])
            self.tags << tag 
        end
    end
end
