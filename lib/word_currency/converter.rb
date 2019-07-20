class WordCurrency::Converter
    CONVERSION_TABLE = {
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
        "01"  => "one",
        "02"  => "two",
        "03"  => "three",
        "04"  => "four",
        "05"  => "five",
        "06"  => "six",
        "07"  => "seven",
        "08"  => "eight",
        "09"  => "nine",
    }

    class << self
        def convert(amount)
            str_amount = amount.to_s
            puts str_amount.length
            *rest, first, second, third = str_amount.split("")
            
            # if first && second && third
            #     if second+third > "1" && second+third < "20" || third == "0"
            #         CONVERSION_TABLE[first] + " hundred and " + CONVERSION_TABLE[second+third] + " Dollars"
            #     else
            #         CONVERSION_TABLE[first] + " hundred and " + CONVERSION_TABLE[second+"0"] + " " + CONVERSION_TABLE[third] + " Dollars"
            #     end
            # elsif first && second
            #     if first+second > "1" && first+second < "20" || second == "0"
            #         CONVERSION_TABLE[first+second] + " Dollars"
            #     else
            #         CONVERSION_TABLE[first+"0"] + " " + CONVERSION_TABLE[second] + " Dollars"
            #     end
            # elsif first
            #     CONVERSION_TABLE[first] + " Dollars"
            # else
            #     "Error"
            # end

            translated = convert_hundred_base(first, second, third)
            translated + " Dollars"
        end


        def convert_hundred_base(hundreds, tens, ones)
            if ones
                base = convert_ten_base(tens, ones)
                base ? "#{CONVERSION_TABLE[hundreds]} hundred and #{convert_ten_base(tens, ones)}" : "#{CONVERSION_TABLE[hundreds]} hundred"
            else
                convert_ten_base(hundreds, tens)
            end
        end

        def convert_ten_base(tens, ones)
            full_num = "#{tens}#{ones}"
            if full_num.to_i > 0 && full_num.to_i < 20 || ones == "0"
                CONVERSION_TABLE[full_num]
            else
                CONVERSION_TABLE[tens+"0"] + " " + CONVERSION_TABLE[ones]
            end
        end
    end
end