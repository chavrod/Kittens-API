class Kitten < ApplicationRecord
  validates :name, :age, :cuteness, :softness, presence: true

  def as_json(options={})
    super(:only => [:id, :name, :age, :cuteness, :softness])
  end
end
