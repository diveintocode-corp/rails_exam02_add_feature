class TitleValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    if value.class != "".class
      record.errors.add(attribute, " must not be empty")
    else
      record.errors.add(attribute, " must be more 1 of characters") if value.empty?
      record.errors.add(attribute, " must be less 255 of ") unless value.length < 256
    end
  end
end
