require 'rails_helper'

RSpec.describe CartsController, :type => :controller do

  let(:valid_attributes) {
  }

  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all carts as @carts" do
      order = Cart.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:carts)).to eq([cart])
    end
  end

  describe "GET show" do
    it "assigns the requested cart as @cart" do
      cart = Cart.create! valid_attributes
      get :show, {:id => cart.to_param}, valid_session
      expect(assigns(:cart)).to eq(cart)
    end
  end

  describe "GET new" do
    it "assigns a new cart as @cart" do
      get :new, {}, valid_session
      expect(assigns(:cart)).to be_a_new(cart)
    end
  end

  describe "GET edit" do
    it "assigns the requested cart as @cart" do
      cart = Cart.create! valid_attributes
      get :edit, {:id => cart.to_param}, valid_session
      expect(assigns(:cart)).to eq(order)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Cart" do
        expect {
          post :create, {:cart => valid_attributes}, valid_session
        }.to change(Cart, :count).by(1)
      end

      it "assigns a newly created cart as @cart" do
        post :create, {:cart => valid_attributes}, valid_session
        expect(assigns(:cart)).to be_a(Cart)
        expect(assigns(:cart)).to be_persisted
      end

      it "redirects to the created cart" do
        post :create, {:cart => valid_attributes}, valid_session
        expect(response).to redirect_to(Cart.last)
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      let(:new_attributes) {
      }

      it "updates the requested cart" do
        cart = Cart.create! valid_attributes
        put :update, {:id => cart.to_param, :cart => new_attributes}, valid_session
        cart.reload
      end

      it "assigns the requested cart as @cart" do
        cart = Cart.create! valid_attributes
        put :update, {:id => cart.to_param, :cart => valid_attributes}, valid_session
        expect(assigns(:cart)).to eq(cart)
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested cart" do
      cart = Cart.create! valid_attributes
      expect {
        delete :destroy, {:id => cart.to_param}, valid_session
      }.to change(cart, :count).by(-1)
    end

    it "redirects to the carts list" do
      cart = Cart.create! valid_attributes
      delete :destroy, {:id => cart.to_param}, valid_session
      expect(response).to redirect_to(order_path)
    end
  end
end
