module Concerns
  module Person

    module Export

      EXPORT_COLS = {
        person: %w(
          member_no
          first_name
          last_name
          chinese_name
          baptism_date
          confirmation_date
          status
          mobile_phone
          work_phone
          fax
          birthday
          email
          website
          suffix
          updated_at
          alternate_email
          account_frozen
          messages_enabled
          visible
          friends_enabled
          member
          staff
          elder
          deacon
          can_sign_in
          visible_to_everyone
          visible_on_printed_directory
          full_access
          status
          legacy_family_id
          share_activity
          child
          custom_type
          description
          family_id
          position
          gender
        ),
        family: %w(
          name
          last_name
          address1
          address2
          city
          state
          zip
          home_phone
          legacy_id
          updated_at
          visible
        )
      } unless defined?(EXPORT_COLS)

      def self.included(mod)
        mod.extend(ClassMethods)
      end

      module ClassMethods
        def to_csv
          CSV.generate do |csv|
            custom_fields = CustomField.all
            csv << EXPORT_COLS[:person] + \
                   EXPORT_COLS[:family].map { |c| "family_#{c}" } + \
                   custom_fields.map(&:slug)
            ::Person.undeleted.includes(:family, :custom_field_values).find_each do |person|
              next unless person.family
              csv << EXPORT_COLS[:person].map { |c| person.send(c) } + \
                     EXPORT_COLS[:family].map { |c| person.family.send(c) } + \
                     custom_fields.map { |f| person.fields[f.id] }
            end
          end
        end

        def to_xml
          custom_fields = CustomField.all
          builder = Builder::XmlMarkup.new
          builder.families do |families|
            Family.undeleted.includes(people: :custom_field_values).find_each do |family|
              families.family do |fam|
                EXPORT_COLS[:family].each do |col|
                  fam.tag!(col, family.send(col))
                end
                fam.people do |people|
                  family.people.sort_by(&:position).each do |person|
                    people.person do |p|
                      EXPORT_COLS[:person].each do |col|
                        p.tag!(col, person.attributes[col])
                      end
                      custom_fields.each do |field|
                        p.tag!(field.slug, person.fields[field.id])
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end

    end
  end
end
