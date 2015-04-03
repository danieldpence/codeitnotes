class Note < ActiveRecord::Base
    has_attached_file :image, styles: { medium: "588x420#", small: "350x250#" },
    default_url: "http://placehold.it/350x250"
    validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
    
end
