# == Schema Information
#
# Table name: comments
#
#  id            :integer          not null, primary key
#  context       :text
#  restaurant_id :integer
#  user_id       :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
# Indexes
#
#  index_comments_on_restaurant_id  (restaurant_id)
#  index_comments_on_user_id        (user_id)
#

class Comment < ApplicationRecord
  belongs_to :restaurant
  belongs_to :user
end
