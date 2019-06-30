class PasswordConfirmationValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return unless record.new_record? || record.changes[:crypted_password]

    record.errors.add(attribute, "doesn't match Password") if value.equal?(record.password)
  end
end
