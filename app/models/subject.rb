class Subject < ApplicationRecord
  # Direct associations

  has_many   :records,
             :dependent => :destroy

  belongs_to :study,
             :counter_cache => true

  # Indirect associations

  # Validations

end
