class Comment < ApplicationRecord
    belongs_to :user
    belongs_to :place
    after_create :send_comment_email

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

    def send_comment_email
      NotificationMailer.comment_added(self).deliver_now
    end

end
