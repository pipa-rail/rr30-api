class CourseResult < ApplicationRecord
  before_validation do
    sprintf('%.2f', self.usd)
    sprintf('%.2f', self.eur)
    sprintf('%.2f', self.rur)
  end


end
