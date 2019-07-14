RSpec.describe WordCurrency do
  it "has a version number" do
    expect(WordCurrency::VERSION).not_to be nil
  end

  it "should convert amount less than 1000" do
    expect(WordCurrency::Converter.convert(123)).to eq("one hundred and twenty three Dollars")
  end
end
