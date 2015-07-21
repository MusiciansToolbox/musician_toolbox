class User < ActiveRecord::Base
  has_many :clips
  # has_many :user_searches # schema is not set up to do this lmaooooo
  has_many :likes
  has_many :opinions do
    def positive
      where(positive: true)
    end
  end
  has_many :influences
  has_and_belongs_to_many :instruments
  has_and_belongs_to_many :genres
  has_and_belongs_to_many :jam_circles
  has_attached_file :profile_picture
  validates_attachment_content_type :profile_picture,
                                    :content_type => [ 'image/gif', 'image/jpeg', 'image/png' ],
                                    :styles => { :large => "500x500>", :thumb => "50x50>" },
                                    :message => ['must be audio file']

  has_secure_password
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true, format: {with: /\A\w+@\w+[.]\w+\z/}
  validates :zipcode, presence: true, format: {with: /\A\d{5}\z|\A\d{5}[-]\d{4}\z/}
  # I think these things down here are now obsolete. Idk.
  accepts_nested_attributes_for :instruments, reject_if: proc { |attributes| attributes['name'].blank? }
  accepts_nested_attributes_for :genres
  accepts_nested_attributes_for :likes

  def liked_musicians
    opinions.positive.map(&:clip).map(&:user).uniq
  end
end
