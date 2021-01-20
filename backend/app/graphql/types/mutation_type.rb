module Types
  class MutationType < Types::BaseObject
    field :create_category, mutation: Mutations::Category::CreateCategory
    field :update_category, mutation: Mutations::Category::UpdateCategory
    field :delete_category, mutation: Mutations::Category::DeleteCategory

    field :create_item, mutation: Mutations::Item::CreateItem
    field :delete_item, mutation: Mutations::Item::DeleteItem
    field :update_item, mutation: Mutations::Item::UpdateItem

    field :create_user, mutation: Mutations::CreateUser

    field :sign_in, mutation: Mutations::SignIn
  end
end
