RSpec.describe WordCurrency do
  it "has a version number" do
    expect(WordCurrency::VERSION).not_to be nil
  end

  it "should convert amount less than 1000" do
    expect(WordCurrency::Converter.convert(123)).to eq("One Hundred and Twenty Three Dollars")
  end
end
