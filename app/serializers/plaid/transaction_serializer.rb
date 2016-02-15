module Plaid
  class TransactionSerializer < ActiveModel::Serializer
    attributes :external_id, :name, :original_name, :amount, :original_category, :type

    def external_id
      object.id
    end
    def original_category
      object.category_id
    end

    def original_name
      object.name
    end

    def type
      'FlexibleSpending'
    end
  end
end