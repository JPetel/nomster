class Comment < ApplicationRecord
    belongs_to :user
    belongs_to :place

    RATINGS = {
      'Five Stars': '5_stars',
      'Four Stars': '4_stars',
      'Three Stars': '3_stars',
      'Two Stars': '2_stars',
      'One Star': '1_stars',
    }

    def humanized_rating
      RATINGS.invert[self.rating]
    end

end
