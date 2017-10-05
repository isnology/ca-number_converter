require 'rails_helper'

RSpec.describe NumberConversion, type: :model do
  it 'should convert numbers to binary' do
    expect(NumberConversion.new(number: 7, base: 2).number_to_base).to eq('111')
    expect(NumberConversion.new(number: 9, base: 2).number_to_base).to eq('1001')
    expect(NumberConversion.new(number: 189, base: 2).number_to_base).to eq('10111101')
    expect(NumberConversion.new(number: 32, base: 2).number_to_base).to eq('100000')
    expect(NumberConversion.new(number: 8534, base: 2).number_to_base).to eq('10000101010110')
    expect(NumberConversion.new(number: 0, base: 2).number_to_base).to eq('0')
    expect(NumberConversion.new(number: 32, base: 1).number_to_base).to eq('undeterminable')
  end
  
  it "should convert numbers to base 3" do
    (0..1000).each do |n|
      actual = n.to_s(3)
      expect(NumberConversion.new(number: n, base: 3).number_to_base).to eq(actual)
    end
  end

  it "should convert numbers to base 3" do
    (0..1000).each do |n|
      actual = n.to_s(16)
      expect(NumberConversion.new(number: n, base: 16).number_to_base).to eq(actual)
    end
    expect(NumberConversion.new(number: 8696, base: 16).number_to_base).to eq('21f8')
  end
  
  it 'should allow valid values' do
    expect(NumberConversion.new(number: 9, base: 16)).to be_valid
    expect(NumberConversion.new(number: 9, base: 2)).to be_valid
    expect(NumberConversion.new(number: 9, base: 7)).to be_valid
    expect(NumberConversion.new(number: 0, base: 7)).to be_valid
  end
  
  it 'should disallow invalid numbers' do
    expect(NumberConversion.new(number: -9, base: 5)).to be_invalid
    expect(NumberConversion.new(number: 'abc', base: 5)).to be_invalid
  end
  
  it 'should disallow invalid bases' do
    expect(NumberConversion.new(number: 5, base: 0)).to be_invalid
    expect(NumberConversion.new(number: 5, base: 1)).to be_invalid
  end

  it 'should disallow missing required attributes' do
    expect(NumberConversion.new).to be_invalid
    expect(NumberConversion.new(number: '', base: '')).to be_invalid
  end
end
