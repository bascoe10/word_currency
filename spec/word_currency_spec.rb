RSpec.describe WordCurrency do
  it "has a version number" do
    expect(WordCurrency::VERSION).not_to be nil
  end

  describe '#convert' do

    let(:conversion_map) {
      {
        "1"  => "one",
        "2"  => "two",
        "3"  => "three",
        "4"  => "four",
        "5"  => "five",
        "6"  => "six",
        "7"  => "seven",
        "8"  => "eight",
        "9"  => "nine",
        "10" => "ten",
        "11" => "eleven",
        "12" => "twelve",
        "13" => "thirteen",
        "14" => "fourteen",
        "15" => "fifteen",
        "16" => "sixteen",
        "17" => "seventeen",
        "18" => "eighteen",
        "19" => "nineteen",
        "20" => "twenty",
        "30" => "thirty",
        "40" => "fourty",
        "50" => "fifty",
        "60" => "sixty",
        "70" => "seventy",
        "80" => "eighty",
        "90" => "ninety",
        "00" => "hundred"
      }
    }

    context 'conversion from 1 to 20' do
      (1..19).each do |number|
        it "should convert number #{number} correctly" do
          expect(WordCurrency::Converter.convert(number)).to eq("#{conversion_map[number.to_s]} Dollars")
        end
      end
    end

    context 'conversion from 20 to 99' do
      (26..36).each do |number|
        it "should convert number #{number} correctly" do
          tens_place, ones_place = number.to_s.split("")
          expect(WordCurrency::Converter.convert(number)).to eq("#{conversion_map[tens_place+"0"]} #{conversion_map[ones_place]} Dollars")
        end
      end
    end

  end

  it "should convert amount less than 1000" do
    expect(WordCurrency::Converter.convert(123)).to eq("one hundred and twenty three Dollars")
  end
end
