module Queries::Customer
  class FetchCustomers < Queries::BaseQuery
    type [Types::Model::CustomerType], null: false

    def resolve
      Customer.where(user: current_user)
    end
  end
end
