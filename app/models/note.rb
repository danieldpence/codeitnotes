class Note < ActiveRecord::Base
    has_attached_file :image, styles: { xlarge: "700x300", large: "350x350", medium: "240x172#", small: "168x120#" },
    default_url: "http://placehold.it/240x172"
    validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
    
    belongs_to :user
end
