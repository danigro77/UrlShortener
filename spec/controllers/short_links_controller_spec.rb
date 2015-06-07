require 'rails_helper'

describe ShortLinksController do
  let(:url) { 'http://www.google.com/this_is-a-test/?params=bla' }
  let(:bad_urls) { ['www.missing-scheme.com', 'simple-string', 'http://missing_end'] }

  describe '#shorten_url' do
    it 'handles valid urls' do
      post :shorten_url, original_url: 'http://www.google.com/this_is-a-test/?params=bla'
      expect(response.status).to eq(200)
    end
    xit 'handles invalid urls' do
      bad_urls.each do |u|
        post :shorten_url, original_url: u
        expect(response).to raise_error(URI::InvalidURIError)
      end
    end
  end
end