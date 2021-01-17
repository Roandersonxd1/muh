module Queries
  class FetchCategory < Queries::BaseQuery
    argument :id, ID, required: true

    type Types::CategoryType, null: false

    def resolve(id:)
      Category.find_by!(id: id)
    rescue ActiveRecord::RecordNotFound => _e
      GraphQL::ExecutionError.new("Category not found with id #{id}.")
    end
  end
end
