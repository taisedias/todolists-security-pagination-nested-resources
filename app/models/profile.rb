class Profile < ActiveRecord::Base
  belongs_to :user

  validate :has_name
  validate :gender_is_male_or_female
  validate :sue_cannot_be_male

  default_scope { order birth_year: :asc }
  scope :get_all_profiles, -> (min_birth_year, max_birth_year){ where("birth_year BETWEEN ? AND ?", min_birth_year, max_birth_year) }

  def has_name
    if ((first_name == nil) && (last_name == nil))
      errors.add(:first_name, 'cannot be nil when last_name is nil')
      errors.add(:last_name, 'cannot be nil when last_name is nil')
    end  
  end

  def gender_is_male_or_female
    if ((gender != "male") && (gender != "female"))
      errors.add(:gender, 'gender must be male or female')
    end
  end

  def sue_cannot_be_male
    if ((gender == "male") && (first_name != nil && first_name.downcase == "sue"))
      errors.add(:first_name, 'Sue cannot be male')
    end  
  end  

end
