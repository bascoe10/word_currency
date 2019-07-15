RSpec.describe WordCurrency do
  it "has a version number" do
    expect(WordCurrency::VERSION).not_to be nil
  end

  describe '#convert' do

    context 'conversion from 1 to 19' do
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
        "19" => "nineteen"
      }.each do |number, number_word|
        it "should convert number #{number} correctly" do
          expect(WordCurrency::Converter.convert(number)).to eq("#{number_word} Dollars")
        end
      end
    end

  end

  it "should convert amount less than 1000" do
    expect(WordCurrency::Converter.convert(123)).to eq("one hundred and twenty three Dollars")
  end
end
