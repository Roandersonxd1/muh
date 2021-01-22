module Queries::Customer
  class FetchCustomer < Queries::BaseQuery
    argument :id, ID, required: true

    type Types::Model::CustomerType, null: false

    def resolve(id:)
      Customer.find_by!(id: id, user: current_user)
    end
  end
end
