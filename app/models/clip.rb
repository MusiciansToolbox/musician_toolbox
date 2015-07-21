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

  def children
    Clip.where(previous_clip_id: self.id)
  end


  def children_json
    clip = self

    child_data = []

    children.each do |child|

      if child.has_children?
        child_data << {
          'name' => child.name,
          'parent' => child.parent,
          'clip_id' => child.id,
          'clip_url' => clip.uploaded_file,
          'clip_instrument' => clip.instrument.name,
          'clip_user' => clip.user.name,
          'children' => child.children_json
        }
      else
        child_data << {
          'name' => child.name,
          'parent' => child.parent,
          'clip_url' => clip.uploaded_file,
          'clip_id' => child.id,
          'clip_instrument' => clip.instrument.name,
          'clip_user' => clip.user.name
        }

      end

    end


    child_data
  end

  def name
    self.title
  end

  def parent
    Clip.find(self.previous_clip_id).name
  end

  def has_children?
    Clip.where(previous_clip_id: self.id).any?
  end

end
