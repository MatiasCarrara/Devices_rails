require "spec_helper"

describe DevicesController, type: :controller do

  describe 'index' do
    it '' do
      get :index
      expect(response.status).to eq(200)
    end
  end

  describe 'new' do
    it '' do
      get :new
      expect(response.status).to eq(200)
   end
  end

  describe 'show' do
    it '' do
      here=Device.new
      here.name='juan'
      here.address='000'
      here.save!
      get :show, params: {id: here.id}
      expect(response).to render_template('show')
    end
  end

  describe 'create' do
    it '' do
      post :create, params: { device: { name:'iPhone', address:'099' } }
      expect(response.status).to eq(302)
    end
  end

end
