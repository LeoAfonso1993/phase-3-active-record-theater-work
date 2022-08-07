class Role < ActiveRecord::Base
    has_many :auditions

    def auditions
        Audition.where(role_id: self.id)
    end

    def actors
        Role.auditions.map{|item| item.actor}
    end

    def location
        Role.auditions.map{|item| item.location}
    end

    actor_hired = self.auditions.select{|item| item.hired == true}

    def lead
        
        if actor_hired.count == 0
            'no actor has been hired for this role'
        else
            actor_hired.first
        end

    end

    def understudy
        if actor_hired.count <= 1
            'no actor has been hired for this role'
        else
            actor_hired.second
        end
        
    end
end