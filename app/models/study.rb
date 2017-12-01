class Study < ApplicationRecord
  # Direct associations

  has_many   :subjects,
             :dependent => :destroy

  belongs_to :user,
             :counter_cache => true

  # Indirect associations

  # Validations

end
