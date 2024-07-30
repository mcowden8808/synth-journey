class AudioEntry < ApplicationRecord
  has_one_attached :audio_file

  validates :audio_file, presence: true
  validate :correct_audio_file_type

  private

  def correct_audio_file_type
    if audio_file.attached? && !valid_audio_type?
      errors.add(:audio_file, 'must be an MP3 or WAV file')
    end
  end

  def valid_audio_type?
    audio_file.content_type.in?(%w(audio/mpeg audio/x-wav))
  end

end
