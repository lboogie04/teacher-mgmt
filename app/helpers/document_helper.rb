module DocumentHelper
    def diff(version_obj, obj)
        changes = {}

        if version_obj.nil?
            obj.attributes.each do |attr, value|
              changes[attr.to_s] = [nil, obj.send(attr)] unless attr.to_s == 'updated_at'
            end
          else
            version_obj.attributes.each do |attr, value|
                next if attr.to_s == 'updated_at'
                
                if version_obj.send(attr) != obj.send(attr)
                    changes[attr.to_s] = [version_obj.send(attr), obj.send(attr)]
                end
            end
        end

        changes_to_string(changes)
     end

     def changes_to_string(changes)
        result = ""
      
        changes.each do |attr, values|
          result += "#{attr.capitalize}: #{values[0]} => #{values[1]}<br>"
        end
      
        result
      end
end