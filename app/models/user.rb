class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :clips
  has_many :user_searches
  has_secure_password

  has_attached_file :profile_picture
  validates_attachment_content_type :profile_picture,
                                    :content_type => [ 'image/gif', 'image/jpeg', 'image/png' ],
                                    :styles => { :large => "500x500>", :thumb => "50x50>" },
                                    :message => ['must be audio file']

  has_and_belongs_to_many :instruments
  has_and_belongs_to_many :genres

  has_many :likes

  has_many :influences

  # I think these things down here now obsolete. Idk.
  accepts_nested_attributes_for :instruments, reject_if: proc { |attributes| attributes['name'].blank? }
  accepts_nested_attributes_for :genres
  accepts_nested_attributes_for :likes
end
