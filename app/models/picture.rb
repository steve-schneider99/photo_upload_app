class Picture < ActiveRecord::Base
  belongs_to :user
  has_many :tags, :dependent => :destroy

  has_attached_file :picture, :styles => { :medium => '300x300>', :thumb => '100x100>' }
  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\Z/

  accepts_nested_attributes_for :tags
end
