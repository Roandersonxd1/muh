module Mutations::Item
  class DeleteItem < Mutations::BaseMutation
    argument :id, ID, required: true
    type Types::ItemType

    def resolve(id: nil)
      item = Item.find(id)
      item.destroy!
      item
    end
  end
end
