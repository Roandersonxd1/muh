module Mutations::Customer
  class UpdateCustomer < Mutations::BaseMutation
    argument :id, ID, required: true

    argument :name, String, required: true
    argument :email, String, required: true
    argument :phone, GraphQL::Types::BigInt, required: true

    type Types::Model::CustomerType

    def resolve(id:, name:, phone:, email:)
      category = Customer.find_by!(id: id, user: current_user)
      category.update!(
        name: name,
        phone: phone,
        email: email
      )
      category
    end
  end
end
