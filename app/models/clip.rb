class Clip < ActiveRecord::Base
  belongs_to :user
  belongs_to :instrument
  belongs_to :jam_circle

  has_many :opinions

  validates :uploaded_file, presence: true unless Rails.env.test?

  has_attached_file :uploaded_file

  validates_attachment_content_type :uploaded_file,
                                    :content_type => /\Aaudio\/.*\Z/,
                                    :message => ['must be audio file']

  validates :user_id, presence: true, numericality: true
  validates :instrument_id, presence: true, numericality: true

end
