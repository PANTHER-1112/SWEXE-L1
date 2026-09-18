class Task < ApplicationRecord
    validates :title , :subject, :deadline , presence: true
end
