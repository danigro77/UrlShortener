require 'rails_helper'

describe ShortLink do

  it { should validate_presence_of(:original) }
  it { should validate_uniqueness_of(:original) }

  it { should validate_presence_of(:short) }
  it { should validate_uniqueness_of(:short) }

end