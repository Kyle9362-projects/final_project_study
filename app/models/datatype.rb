class Datatype < ApplicationRecord
  # Direct associations

  has_many   :studies,
             :dependent => :destroy

  # Indirect associations

  # Validations

end
