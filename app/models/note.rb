class Note < ActiveRecord::Base
    has_attached_file :image, styles: { xlarge: "700x300", large: "350x350", medium: "240x172#", small: "168x120#" },
    default_url: "http://placehold.it/240x172"
    validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
    
    belongs_to :user
    has_many :taggings
    has_many :tags, through: :taggings
    
    def tag_list
        self.tags.collect do |tag|
            tag.name
        end.join(", ")
    end
    
    def tag_list=(tags_string)
        tag_names = tags_string.split(",").collect{|s| s.strip.downcase}.uniq
        new_or_found_tags = tag_names.collect { |name| Tag.find_or_create_by(name: name) }
        self.tags = new_or_found_tags
    end
    
end
