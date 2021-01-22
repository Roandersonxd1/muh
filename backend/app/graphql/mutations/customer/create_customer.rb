module Mutations::Customer
  class CreateCustomer < Mutations::BaseMutation
    argument :name, String, required: true
    argument :email, String, required: true
    argument :phone, GraphQL::Types::BigInt, required: true

    type Types::Model::CustomerType

    def resolve(name:, phone:, email: )
      Customer.create!(
        name: name,
        phone: phone,
        email: email,
        user: context[:current_user]
      )
    end
  end
end
