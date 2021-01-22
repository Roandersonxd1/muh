module Mutations::Customer
  class DeleteCustomer < Mutations::BaseMutation
    argument :id, ID, required: true

    type Types::Model::CustomerType

    def resolve(id: nil)
      category = Customer.find_by!(id: id, user: current_user)
      category.destroy!
      category
    end
  end
end
