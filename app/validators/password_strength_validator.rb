class PasswordStrengthValidator < ActiveModel::EachValidator
    def validate_each(record, attribute, value)
      unless value =~ /(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{8,}/
        record.errors.add(attribute, 'must include at least one lowercase letter, one uppercase letter, and one digit, and be at least 8 characters long.')
      end
    end
  end