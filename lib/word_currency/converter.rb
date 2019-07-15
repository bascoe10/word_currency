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
        "00" => "hundred"
    }

    class << self
        def convert(amount)
            str_amount = amount.to_s
            puts str_amount
            *rest, first, second, third = str_amount.split("")
            
            if first && second && third
                if second+third > "1" && second+third < "20"
                    CONVERSION[first] + " hundred and " + CONVERSION[second+third] + " Dollars"
                else
                    CONVERSION[first] + " hundred and " + CONVERSION[second+"0"] + " " + CONVERSION[third] + " Dollars"
                end
            elsif first && second
                if first+second > "1" && first+second < "20"
                    CONVERSION[first+second] + " Dollars"
                else
                    CONVERSION[second+"0"] + " " + CONVERSION[third] + " Dollars"
                end
            elsif first
                CONVERSION[first] + " Dollars"
            else
                "Error"
            end
        end
    end
end