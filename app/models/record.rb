class Record < ApplicationRecord
  # Direct associations

  belongs_to :data_type,
             :class_name => "Datatype"

  belongs_to :subject

  # Indirect associations

  # Validations

end
