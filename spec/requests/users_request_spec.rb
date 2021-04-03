# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Users', type: :request do
  before do
    @user = create(:user)
    @admin = create(:admin)

    @users_url = '/users'
    @base_url = '/auth/sign_in'

    @login_user_params = {
      email: @user.email,
      password: @user.password
    }
    @login_admin_params = {
      email: @admin.email,
      password: @admin.password
    }
  end

  describe 'GET /users' do
    context 'logged in as administrator' do
      before { post @base_url, params: @login_admin_params }

      it 'show all users' do
        get @users_url, headers: headers
        expect(response).to have_http_status(200)
      end
    end

    context 'logged in as user' do
      before { post @base_url, params: @login_user_params }

      it 'show all users' do
        get @users_url, headers: headers
        expect(response).to have_http_status(403)
      end
    end
  end

  # ---------------------------------------------------------------------------

  describe 'GET /users/:id' do
    context 'logged in as administrator' do
      before { post @base_url, params: @login_admin_params }

      it 'view other users records' do
        get "#{@users_url}/#{create(:user).id}", headers: headers
        expect(response).to have_http_status(200)
      end

      it 'seeing your own record' do
        get "#{@users_url}/#{@admin.id}", headers: headers
        expect(response).to have_http_status(200)
      end
    end

    context 'logged in as user' do
      before { post @base_url, params: @login_user_params }

      it 'seeing your own record' do
        get "#{@users_url}/#{@user.id}", headers: headers
        expect(response).to have_http_status(200)
      end

      it 'view other users records' do
        get "#{@users_url}/#{create(:user).id}", headers: headers
        expect(response).to have_http_status(403)
      end
    end
  end

  #------------------------------------------------------------

  def headers
    {
      'uid' => response.headers['uid'],
      'client' => response.headers['client'],
      'access-token' => response.headers['access-token']
    }
  end
end
