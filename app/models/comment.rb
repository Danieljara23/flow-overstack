# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  content    :text
#  post_id    :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Comment < ApplicationRecord
	belongs_to :post
	belongs_to :user

	validates :content, :user_id, :post_id, presence: true
	validates :content, length: {maximum: 300}
end
