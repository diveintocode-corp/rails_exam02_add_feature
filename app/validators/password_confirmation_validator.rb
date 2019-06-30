class PasswordConfirmationValidator < ActiveModel::EachValidator
  PERMITTED_CLASS = ['User'].freeze

  def validate_each(record, attribute, value)
    raise 'UnpermittedClassError' unless PERMITTED_CLASS.include?(record.class.name)

    return unless record.new_record? || record.changes[:crypted_password]

    record.errors.add(attribute, "doesn't match Password") if value.equal?(record.password)
  end
end
