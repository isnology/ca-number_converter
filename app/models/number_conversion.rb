class NumberConversion < ApplicationRecord
  validates :number, numericality: {greater_than_or_equal_to: 0}
  validates :base, numericality: {greater_than_or_equal_to: 2}
  
  TRANS = ('0'..'9').to_a + ('a'..'z').to_a
  def number_to_base
    base = self.base
    number = self.number
    
    return '0' if number < 1
    return 'undeterminable' if base < 2
  
    
    output = ''
    while number > 0
      digit = number % base
      output = TRANS[digit] + output
      number = number / base
    end
    output
  end
end
