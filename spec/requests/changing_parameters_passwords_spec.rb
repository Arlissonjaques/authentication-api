# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'changing parameters', type: :request do
  before do
    @user = create(:user)
    @url_login = '/auth/sign_in'
    @base_url = '/auth'
    @login_params = {
      email: @user.email,
      password: @user.password
    }

    post @url_login, params: @login_params

    @headers = {
      'uid' => response.headers['uid'],
      'client' => response.headers['client'],
      'access-token' => response.headers['access-token']
    }
  end

  describe 'PUT /auth' do
    before { @name = %w[Albert Einstein] }

    describe 'when logged' do
      context 'with correct params' do
        it 'return status 200' do
          put @base_url, params: { first_name: @name.first, last_name: @name.last }, headers: @headers
          expect(response).to have_http_status(200)
        end
      end

      context 'with incorrect params' do
        it 'return status 422' do
          put @base_url, headers: @headers
          expect(response).to have_http_status(422)
        end
      end
    end

    describe 'when not logged in' do
      context 'with correct params' do
        it 'return status 422' do
          put @base_url, params: nil, headers: @headers
          expect(response).to have_http_status(422)
        end
      end

      context 'with incorrect params' do
        it 'return status 422' do
          put @base_url, headers: @headers
          expect(response).to have_http_status(422)
        end
      end
    end
  end

  # -----------------------------------------------------------------------------------

  describe 'PUT auth/password' do
    before do
      @url_password_change = '/auth/password'
      @password_params = {
        "password": '87654321',
        "password_confirmation": '87654321',
        "current_password": @user.password
      }
    end

    describe 'when logged' do
      context 'with valid params' do
        it 'password changed' do
          put @url_password_change, params: @password_params, headers: @headers
          expect(response).to have_http_status(200)
        end
      end

      context 'with invalid params' do
        it 'failed to change password' do
          put @url_password_change, headers: @headers
          expect(response).to have_http_status(422)
        end
      end
    end

    describe 'when not logged in' do
      it 'unauthorized' do
        put @url_password_change, params: @password_params
        expect(response).to have_http_status(401)
      end
    end
  end
end
