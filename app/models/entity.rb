class Entity < ActiveRecord::Base
=begin
  t.integer :app_id
  t.float :avg_score
  t.string :foreign_id
  t.string :foreign_url
  t.string :name
  t.integer :review_count

  t.timestamps
=end

  # relationships
  belongs_to :app
  has_many :reviews
  
  # callbacks
  before_create :ensure_default_values
  before_save :ensure_default_values

  # validations
  validates :app_id, :presence => true
  validates :foreign_id, :presence => true

  private
    
    def ensure_default_values
      self.avg_score = 0 if self.avg_score.nil?
      self.foreign_url = "" if self.foreign_url.nil?
      self.name = "" if self.name.nil?
      self.review_count = 0 if self.review_count.nil?
    end
end
