class Datatype < ApplicationRecord
  # Direct associations

  has_many   :records,
             :foreign_key => "data_type_id",
             :dependent => :destroy

  has_many   :studies,
             :dependent => :destroy

  # Indirect associations

  # Validations

end
