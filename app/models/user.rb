class User < ApplicationRecord
    enum kind: { teacher: 0, student: 1 }
    has_many :enrollments, foreign_key: :user_id
    has_many :favorite_teachers, -> { where(favorite: true) }, through: :enrollments, source: :teacher

    def favorites
            favorite_teachers
    end
end
