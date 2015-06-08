class ShortLink < ActiveRecord::Base

  before_validation :create_short_link

  validates :original, presence: true, uniqueness: { case_sensitive: false }, url:true
  validates :short, presence: true, uniqueness: { case_sensitive: true }
  validates_format_of :original, :with => URI::regexp(%w(http https))

  def create_short_link
    existing = ShortLink.find_by_original(self.original)
    unless existing
      self.short = next_link
    end
  end

  private

  def next_link
    last_link_object =  ShortLink.last
    if last_link_object
      last_link = last_link_object.short
      last_char = last_link[-1]
      if last_char == 'Z'
        last_link + '0'
      else
        arr = ('0'..'9').to_a + ('a'..'z').to_a + ('A'..'Z').to_a
        index = arr.index(last_char)
        last_link[0..-2] + arr[index+1]
      end
    else
      '0'
    end
  end
end
