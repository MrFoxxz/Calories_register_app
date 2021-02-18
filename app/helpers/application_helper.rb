module ApplicationHelper
    def flash_class(key)
        case key
            when 'success' then 'is-success'
            when 'info' then 'is-info'
            when 'danger' then 'is-danger'
        end
    end
end
