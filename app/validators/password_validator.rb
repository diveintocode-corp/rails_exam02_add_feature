class PasswordValidator < ActiveModel::EachValidator
  PERMITTED_CLASS = ['User'].freeze
  PASSWORD_REGEX = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$/.freeze

  def validate_each(record, attribute, value)
    raise 'UnpermittedClassError' unless PERMITTED_CLASS.include?(record.class.name)

    return unless record.new_record? || record.changes[:crypted_password]

    record.errors.add(attribute, "can't be blank") if value.blank?
    record.errors.add(attribute, 'must be over 8 characters and contain uppercase and number') unless value.match?(PASSWORD_REGEX)
  end
end
