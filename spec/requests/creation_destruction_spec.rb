# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'account creation and destruction', type: :request do

  before do
    @user = create(:user)
    @base_url = '/auth'
    @signup_params = {
      first_name: 'Oloko',
      last_name: 'Meu',
      email: 'example@test.com',
      password: '12345678'
    }
  end

  describe 'account creation' do
    context 'with valid parameters' do
      before { post @base_url, params: @signup_params }

      it { expect(response).to have_http_status(200) }

      it { expect(response.headers['access-token']).to be_present }

      it { expect(response.headers['client']).to be_present }

      it { expect(response.headers['uid']).to be_present }

      it 'returns status success' do
        parsed_response = JSON.parse(response.body)
        expect(parsed_response['status']).to eq('success')
      end
    end

    context 'with invalid parameters' do
      before { post @base_url, params: nil }

      it { expect(response).to have_http_status(422) }
    end
  end

  #-------------------------------------------------------------------------

  describe 'deleting account' do
    before do
      post @base_url, params: @signup_params
      @headers = {
        'uid' => response.headers['uid'],
        'client' => response.headers['client'],
        'access-token' => response.headers['access-token']
      }
      delete @base_url, headers: @headers
    end

    context 'when logged' do
      it { expect(response).to have_http_status(200) }
    end

    context 'when not logged in' do
      before { delete @base_url, headers: nil }
      it { expect(response).to have_http_status(404) }
    end
  end
end
