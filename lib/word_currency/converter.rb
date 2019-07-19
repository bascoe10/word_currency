class WordCurrency::Converter
    CONVERSION = {
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
    }

    class << self
        def convert(amount)
            str_amount = amount.to_s
            puts str_amount.length
            *rest, first, second, third = str_amount.split("")
            
            # if first && second && third
            #     if second+third > "1" && second+third < "20" || third == "0"
            #         CONVERSION[first] + " hundred and " + CONVERSION[second+third] + " Dollars"
            #     else
            #         CONVERSION[first] + " hundred and " + CONVERSION[second+"0"] + " " + CONVERSION[third] + " Dollars"
            #     end
            # elsif first && second
            #     if first+second > "1" && first+second < "20" || second == "0"
            #         CONVERSION[first+second] + " Dollars"
            #     else
            #         CONVERSION[first+"0"] + " " + CONVERSION[second] + " Dollars"
            #     end
            # elsif first
            #     CONVERSION[first] + " Dollars"
            # else
            #     "Error"
            # end

            translated = convert_hundred_base(first, second, third)
            translated + " Dollars"
        end


        def convert_hundred_base(hundreds, tens, ones)
            if ones
                "#{CONVERSION[hundreds]} hundred #{convert_ten_base(tens, ones)}"
            else
                convert_ten_base(hundreds, tens)
            end
        end

        def convert_ten_base(tens, ones)
            full_num = "#{tens}#{ones}"
            if full_num.to_i > 0 && full_num.to_i < 20
                CONVERSION[full_num]
            else
                CONVERSION[tens+"0"] + " " + CONVERSION[ones]
            end
        end
    end
end