class Item < ApplicationRecord
  belongs_to :user

  def completed?
    completed_ad.present?
  end
end
