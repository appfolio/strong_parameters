module ActiveModel
  class ForbiddenAttributes < StandardError
  end

  module ForbiddenAttributesProtection
    def sanitize_for_mass_assignment(*args)
      new_attributes = args.first
      if !new_attributes.respond_to?(:permitted?) || (new_attributes.respond_to?(:permitted?) && new_attributes.permitted?)
        super
      else
        raise ActiveModel::ForbiddenAttributes
      end
    end
  end
end

ActiveModel.autoload :ForbiddenAttributesProtection
