require 'hikidoc'

class Entry < ActiveRecord::Base
  def to_html
    HikiDoc.to_html(body, :level => 3)
  end
end
