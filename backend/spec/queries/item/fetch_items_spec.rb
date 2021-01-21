require 'rails_helper'

RSpec.describe Queries::Item::FetchItems, type: :request do
  let!(:user) { create(:user) }
  let!(:user_headers) { header_for_user(user) }
  let!(:item) { create_list(:item, 1, user: user)[0] }
  let!(:item2) { create_list(:item, 1)[0] }

  describe 'when data is valid' do
    before(:each) do
      graphql_post(headers: user_headers)
    end

    subject { json_response('fetchItems') }

    it 'returns categories quantity by token user' do
      expect(subject.length).to eq(1)
    end

    it 'returns items data' do
      item_data = subject[0]
      category_data = item_data['category']

      expect(item_data).to include(
        'id' => item.id.to_s,
        'userId' => user.id.to_s,
        'name' => item.name,
        'description' => item.description,
        'salePrice' => item.sale_price,
        'purchasePrice' => item.purchase_price
      )

      expect(category_data).to include(
        'id' => item.category.id.to_s,
        'name' => item.category.name
      )
    end
  end

  def query
    <<~GQL
      {
        fetchItems
        {
          id
          userId
          name
          description
          salePrice
          purchasePrice
          category {
            id
            name
          }
        }
      }
    GQL
  end
end
