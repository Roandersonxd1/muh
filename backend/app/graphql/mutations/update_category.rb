module Mutations
  class UpdateCategory < BaseMutation
    argument :id, ID, required: true
    argument :name, String, required: true

    type Types::CategoryType

    def resolve(id:, name:)
      category = Category.find_by!(id: id)
      category.update!(name: name)
      category
    rescue ActiveRecord::RecordNotFound => _e
      GraphQL::ExecutionError.new("Category not found with id #{id}.")
    rescue ActiveRecord::RecordInvalid => e
      GraphQL::ExecutionError.new("Invalid input: #{e.record.errors.full_messages.join(', ')}")
    end
  end
end
