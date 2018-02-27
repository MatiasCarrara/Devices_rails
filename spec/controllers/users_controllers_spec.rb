require "rails_helper"

describe UsersController, type: :controller do
  let(:general) { User }

  describe 'GET #index' do
    let(:users) { create(:user, :first_name) }

    before do
      get :index
    end
    it 'status codes' do
      expect(response).to have_http_status(:ok)
    end
    it 'redirect index' do
      expect(response).to render_template(:index)
    end
    it 'get all users' do
      expect(assigns(:user)).to match_array(users)
    end
  end

  describe 'GET #new' do
    before do
      get :new
    end
    it 'status codes' do
      expect(response).to have_http_status(:ok)
    end
    it 'redirect show ' do
      expect(response).to render_template(:new)
    end
    it 'assigns a user to User' do
      expect(assigns(:user)).to be_a(general)
    end
  end

  describe 'GET #show' do
    context 'the ID is valid' do
      let(:users) { create(:user, :first_name) }

      before do
        get :show, params: { id: users }
      end
      it 'redirect show' do
        expect(response).to render_template('show')
      end
      it 'status codes' do
        expect(response).to have_http_status(:ok)
      end
      it '' do
        expect(assigns(:user)).to eq(users)
      end
    end

    context 'the ID is invalid' do
      let(:invalid) { 'id_invalid' }

      before do
        get :show, params: {id: invalid}
      end
      it 'status codes' do
        expect(response).to have_http_status(:not_found)
      end
      it 'redirect to error page' do
        expect(response).to render_template('error')
      end
    end
  end

  describe 'GET #edit' do
    context 'si la ID es valida' do
      let(:users) { create(:user, :first_name) }

      before do
        get :edit, params: { id: users }
      end
      it 'status code' do
        expect(response).to have_http_status(:ok)
      end
      it 'redirect to edit' do
        expect(response).to render_template('edit')
      end
      it 'assigns requested user to Device' do
        expect(assigns(:user)).to eq(users)
      end
    end

    context 'si la ID es invalida' do
      let(:invalid) { 'id_invalid' }

      before do
        get :show, params: {id: invalid}
      end
      it 'status code ' do
        expect(response).to have_http_status(:not_found)
      end
      it 'redirect to error page' do
        expect(response).to render_template('error')
      end
    end
  end

  describe 'PUT #update' do
    let(:users) { create(:user, :first_name) }
    context '' do
      let(:params) { { first_name: 'ViewSonic', last_name: "Edifier", email: "@gmail.com" } }
      before do
        patch :update, params: { id: users, user: params }
      end
      it 'status code' do
        expect(response).to have_http_status(:found)
      end
      it 'redirects user' do
        expect(:user).to redirect_to(users)
      end
      it 'assigns requested user to Device' do
        expect(assigns(:user)).to eq(users)
      end
      it 'update data' do
        users.reload
        expect(users.first_name).to eq('ViewSonic')
      end
    end

    context '' do
      let(:params) { { first_name: nil, last_name: "Edifier", email: "@gmail.com" } }

      before do
        patch :update, params: { id: users, user: params }
      end
      it 'status code' do
          expect(response).to have_http_status(:unprocessable_entity)
      end
      it 'redirect to the edit ' do
        expect(response).to render_template('edit')
      end
    end
  end

 describe 'POST #create' do
   context 'valid parameters' do
     let(:users) {attributes_for(:user, :first_name)}

     before do
       post :create, params: { user: users }
     end
     it 'status codes' do
       expect(response).to have_http_status(:found)
     end
     it 'create user' do
       # expect { post :create, params: { user: users } }
       #   .to change(general, :count).by(1)
         # expect{post :create, params: { user: users } }.to change{general.count}.by(1)
     end
     it 'redirect to the user' do
       expect(:user).to redirect_to(general.last)
     end
   end

   context 'invalid parameters' do
     let(:invalid) { attributes_for(:user, :invalid_first_name) }

     before do
      post :create, params: { user: invalid }
     end
     it 'status codes' do
       expect(response).to have_http_status(:unprocessable_entity)
     end
     it 'not create user ' do
       expect { post :create, params: { user: invalid } }
         .to change(general, :count).by(0)
     end
     it 'render template new' do
       expect(response).to render_template('new')
     end
   end
  end

  describe 'DELETE #destroy' do
    let!(:users) { create(:user, :first_name) }
    let(:destroy) {delete :destroy, params: { id: users }}
    it 'status code' do
      destroy
      expect(response).to have_http_status(:found)
    end
    it 'delete user' do
       expect { destroy }
       .to change(general, :count).by(-1)
    end
    it 'redirect index' do
       destroy
       expect(response).to redirect_to users_path
    end
  end

end
