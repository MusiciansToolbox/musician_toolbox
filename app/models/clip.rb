class Clip < ActiveRecord::Base
  belongs_to :user
  belongs_to :instrument
  has_many :opinions
  has_attached_file :uploaded_file
  validates_attachment_content_type :uploaded_file,
                                    :content_type => /\Aaudio\/.*\Z/,
                                    :message => ['must be audio file']


  validates :user_id, presence: true, numericality: true
  validates :instrument_id, presence: true, numericality: true
  # before_uploaded_file_post_process :fetch_media_length
  #
  # validates :duration, :presence => true, :numericality => { :less_than_or_equal_to => 2.minutes }
  #
  # def fetch_media_length
  #   duration_in_seconds = 1.0
  #
  #   begin
  #     clip_file_path = uploaded_file.queued_for_write[:original].path
  #
  #     duration_in_seconds = FFMPEGWrapper.duration_in_seconds(clip_file_path)
  #   end
  #
  #   self.duration = duration_in_seconds
  # end

end
