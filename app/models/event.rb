class Event < ActiveRecord::Base
    has_many :comments
    belongs_to :user
    has_many :joins
    has_many :users, through: :joins

    validates :name, :city, :state, presence: true
    # validates :date

    def future_date
        if date.present? && date < Date.today
          errors.add(:date, "can't be in the past")
        end
    end 
end
