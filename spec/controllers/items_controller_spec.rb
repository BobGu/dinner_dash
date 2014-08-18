require 'rails_helper'

RSpec.describe ItemsController, :type => :controller do 

	let(:valid_attributes) do 
		{ id: 					1567,
			title: 			 'Pie Title',
			description: 'Delicious Pie',
			price_slice: 	6.50,
			price_pie: 		25.00
		}
	end

	describe 'GET index' do 
		it 'assigns all items as @items' do 
			item = Item.create! valid_attributes
			get :index
			expect(assigns(:items)).to eq([item])
		end
	end

	describe 'GET show' do
		it 'assigns the requested item as @item' do
			item = Item.create! valid_attributes
			get :show, {:id => item.to_param}
			expect(assigns(:item)).to eq(item)
		end
	end

	describe 'GET new' do 
		it 'assigns a new item as @item' do 
			get :new
			expect(assigns(:item)).to be_a_new(Item)
		end
	end

	describe 'GET edit' do
		it 'assigns the requested person as @item' do 
			item = Item.create! valid_attributes
			get :edit, {:id => item.to_param}

			expect(assigns(:item)).to eq(item)
		end
	end

	describe 'POST create' do 
		describe 'with valid params' do 
			it 'creates a new Item' do 
				expect {
					post :create, {:item => valid_attributes}
				}.to change(Item, :count).by(1)
			end
		end

		it 'assigns a newly create item as @item' do 
			post :create, {:item => valid_attributes}
			expect(assigns(:item)).to be_a(Item)
			expect(assigns(:item)).to be_persisted
		end

		it 'redirects to the created item' do 
			post :create, {:item => valid_attributes}
			expect(response).to redirect_to(Item.last)
		end
	end

	describe 'PUT update' do 
		describe 'with valid params' do 
			let(:new_attributes) do
				{ title: 'A Better Pie Title', 
					description: 'A more delicious pie.'
				}
			end

			it 'updates the requested item' do 
				item = Item.create! valid_attributes
				put :update, {:id => item.to_param, :item => new_attributes}
				item.reload
				expect(assigns(item)).to eq(new_attributes[:item])
			end

			it 'assigns the requested item as @item' do 
				item = Item.create! valid_attributes
				put :update, {:id => item.to_param, :item => valid_attributes}
				expect(assigns(:item)).to eq(item)
			end

			it 'redirects to the item' do 
				item = Item.create! valid_attributes
				put :update, {:id => item.to_param, :item => valid_attributes}
				expect(response).to redirect_to(item)
			end
		end

	end

	describe 'DELETE destroy' do 
		it 'destroys the requested item' do 
			item = Item.create! valid_attributes

			expect {
				delete :destroy, {:id => item.to_param}
			}.to change(Item, :count).by(-1)
		end

		it 'redirects to the people list' do
			item = Item.create! valid_attributes

			delete :destroy, {:id => item.to_param}
			expect(response).to redirect_to(items_url)
		end
	end

end