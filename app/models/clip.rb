class Clip < ActiveRecord::Base
  belongs_to :user
  belongs_to :instrument

  has_attached_file :uploaded_file
  validates_attachment_content_type :uploaded_file, :content_type => /\Aaudio\/.*\Z/

  validates :user_id, presence: true, numericality: true
  validates :instrument_id, presence: true, numericality: true

end
