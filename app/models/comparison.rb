# == Schema Information
#
# Table name: comparisons
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Comparison < ActiveRecord::Base
  has_many :pictures

  def associate(session_pics)
    session_pics.each do |pic|
      pic.comparison = self
      pic.save
    end
  end

  def pic_picker(session_pics)
    selected_pics ||= []
    if session_pics.length == 10
      2.times { selected_pics << session_pics.pop }
    else
      selected_pics << session_pics.shuffle.pop
    end
    selected_pics  
  end



end
