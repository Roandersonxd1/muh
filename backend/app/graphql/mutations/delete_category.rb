module Mutations
  class DeleteCategory < BaseMutation
    argument :id, ID, required: true
    type Types::CategoryType

    def resolve(id: nil)
      category = Category.find(id)
      category.destroy!
      category
    rescue ActiveRecord::RecordNotFound => _e
      GraphQL::ExecutionError.new("Category not found with id #{id}.")
    end
  end
end
