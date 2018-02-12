require "rails_helper"

describe DevicesController, type: :controller do

  let(:esto) {Device}

  describe 'GET index' do
    let(:devices) { [create(:device, :name)] }
    before do
      get :index
    end
    it '' do
      expect(response).to have_http_status(:ok)
    end
    it '' do
      expect(response).to render_template(:index)
    end
    it '' do
      expect(assigns(:device)).to match_array(devices)
    end
  end

  describe 'new' do
    before do
      get :new
    end
    it '' do
      expect(response).to have_http_status(:ok)
    end
    it '' do
      expect(response).to render_template(:new)
    end
    it '' do
      expect(assigns(:device)).to be_a(esto)
    end
  end

  describe 'show' do

    context 'si la ID es valida' do
      subject { [create(:device, :name)] }

      before do
        get :show, params: { id: subject }
      end
      it '' do
        expect(response).to render_template('show')
      end
      it '' do
        expect(response).to have_http_status(:ok)
      end
      it '' do
        expect(assigns(:device)).to eq(subject)
      end
    end

    context 'si la ID es invalida' do
      let(:invalid) { 'id_invalid' }

      before do
        get :show, params: {id: invalid}
      end
      it '' do
        expect(response).to have_http_status(:not_found)
      end
      it '' do
        expect(response).to render_template('error')
      end
    end
  end

  describe 'create' do
    context 'parametros validos' do
      let(:hola) {attributes_for(:device, :name)}

      before do
        post :create, params: { device: hola }
      end
      it '' do
        expect(response).to have_http_status(:found)
      end
      it '' do
        expect { post :create, params: { device: hola } }
          .to change(esto, :count).by(1)
      end
      it '' do
        expect(:device).to redirect_to(esto.last)
      end
    end

    context 'parametros invalidos' do
      let(:invalid) {attributes_for(:device, :invalid_name)}

      before do
       post :create, params: { device: invalid }
      end
      it '' do
        expect(response).to have_http_status(:unprocessable_entity)
      end
      it '' do
        expect { post :create, params: { device: invalid } }
          .to change(esto, :count).by(0)
      end
      it '' do
        expect(response).to render_template('new')
      end
    end
  end

end
