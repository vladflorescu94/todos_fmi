class Task < ActiveRecord::Base
  # validates_presence_of :title
  # validates_numericality_of :title
  # validate :custom_check

  before_save :append_to_title

  # def custom_check
  #   if !(self.title == /a/)
  #     errors.add(:base, "Should contain letter 'a'");
  #   end
  # end

  def append_to_title
    self.title = '* ' + self.title + ' *'
  end
end
