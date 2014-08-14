require 'rails_helper'

RSpec.describe ApplicationController, type: :controller do
  controller do
    def index
      render nothing: true
    end
  end

  describe 'carts' do
    it 'creates me a cart if I don\'t have one' do
      # no cart
      expect(session[:cart_id]).to be_nil

      # give me a cart
      get :index
      expected_id = Cart.count
      expect(session[:cart_id]).to eq expected_id
      expect(Cart.find expected_id).to be_a_kind_of Cart

      # don't swap out my cart, yo!
      get :index
      expect(session[:cart_id]).to eq expected_id
      expect(Cart.count).to eq expected_id
    end

    it 'can get my cart' do
      cart = Cart.create!
      session[:cart_id] = cart.id
      expect(controller.cart).to eq cart
    end
  end
end
