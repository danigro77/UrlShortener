class ShortLink < ActiveRecord::Base

  has_many :path_names, dependent: :destroy

  validates :original, presence: true, uniqueness: { case_sensitive: false }
  validates :short, presence: true, uniqueness: { case_sensitive: true }

end