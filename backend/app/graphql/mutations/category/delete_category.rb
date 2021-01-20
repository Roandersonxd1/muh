module Mutations::Category
  class DeleteCategory < Mutations::BaseMutation
    argument :id, ID, required: true

    type Types::CategoryType

    def resolve(id: nil)
      category = Category.find(id)
      category.destroy!
      category
    end
  end
end