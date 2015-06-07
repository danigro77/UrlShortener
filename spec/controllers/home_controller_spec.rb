require 'rails_helper'

describe HomeController do
  let(:url) {'http://www.google.com/this_is-a-test/?params=bla'}

  describe '#index' do
    it 'is loading' do
      get :index
      expect(response.status).to eq(200)
    end
  end
end