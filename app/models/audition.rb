class Audition < ActiveRecord::Base
    belongs_to :role

    def role
        Role.find(self.role_id)
    end

    def call_back
        self.update(hired: true)
    end
end