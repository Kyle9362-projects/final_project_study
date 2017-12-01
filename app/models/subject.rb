class Subject < ApplicationRecord
  # Direct associations

  belongs_to :study,
             :counter_cache => true

  # Indirect associations

  # Validations

end
