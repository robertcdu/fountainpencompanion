require 'rails_helper'

describe Admins::DashboardsController do
  let(:admin) { create(:admin) }

  describe '#show' do
    it 'requires authentication' do
      get '/admins/dashboard'
      expect(response).to redirect_to(new_admin_session_path)
    end

    context 'signed in' do
      before(:each) do
        sign_in(admin)
      end

      it 'renders' do
        get '/admins/dashboard'
        expect(response).to be_successful
      end
    end

    context 'signed in as user' do
      let(:user) { create(:user) }
      before(:each) do
        sign_in(user)
      end

      it 'requires authentication' do
        get '/admins/dashboard'
        expect(response).to redirect_to(new_admin_session_path)
      end
    end

    context 'signed in as user with admin email address' do
      let(:user) { create(:user, email: admin.email) }
      before(:each) do
        sign_in(user)
      end

      it 'renders' do
        get '/admins/dashboard'
        expect(response).to be_successful
      end
    end
  end

end
