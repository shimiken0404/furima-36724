class BuyItem < ApplicationRecord
   belongs_to :item
   has_one    :get_user
   belongs_to :user

end
