module Mutations::Item
  class UpdateItem < Mutations::BaseMutation
    argument :id, ID, required: true
    argument :category_id, ID, required: false
    argument :name, String, required: false
    argument :item_type, String, required: false
    argument :description, String, required: false
    argument :sale_price, Float, required: false
    argument :purchase_price, Float, required: false

    type Types::Model::ItemType

    def resolve(params)
      item = Item.find_by!(id: params[:id], user: current_user)
      item.update!(params)
      item
    end
  end
end
