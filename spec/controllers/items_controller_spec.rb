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

end