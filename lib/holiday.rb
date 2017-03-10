require 'pry'

holiday_hash =
  {
    :winter => {
      :christmas => ["Lights", "Wreath"],
      :new_years => ["Party Hats"]
    },
    :summer => {
      :fourth_of_july => ["Fireworks", "BBQ"]
    },
    :fall => {
      :thanksgiving => ["Turkey"]
    },
    :spring => {
      :memorial_day => ["BBQ"]
    }
  }
def second_supply_for_fourth_of_july(holiday_hash)
  # given that holiday_hash looks like this:
  # {
  #   :winter => {
  #     :christmas => ["Lights", "Wreath"],
  #     :new_years => ["Party Hats"]
  #   },
  #   :summer => {
  #     :fourth_of_july => ["Fireworks", "BBQ"]
  #   },
  #   :fall => {
  #     :thanksgiving => ["Turkey"]
  #   },
  #   :spring => {
  #     :memorial_day => ["BBQ"]
  #   }
  # }
  # return the second element in the 4th of July array
  holiday_hash[:summer][:fourth_of_july][1]
end

def add_supply_to_winter_holidays(holiday_hash, supply)
  # holiday_hash is identical to the one above
  # add the second argument, which is a supply, to BOTH the
  # Christmas AND the New Year's arrays

  #holiday_hash[:winter].each do |key, value|
    holiday_hash[:winter][:christmas].push(supply)
    holiday_hash[:winter][:new_years].push(supply)
  #end

end


def add_supply_to_memorial_day(holiday_hash, supply)
  # again, holiday_hash is the same as the ones above
  # add the second argument to the memorial day array
  holiday_hash[:spring][:memorial_day].push(supply)

end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  # code here
  # remember to return the updated hash
  holiday_hash[season] = {holiday_name => supply_array}
  holiday_hash

end

def all_winter_holiday_supplies(holiday_hash)
  # return an array of all of the supplies that are used in the winter season
  supplies_to_return = []
  holiday_hash.each do |season, value|
    if season == :winter
      #puts holiday_hash[season]
      holiday_hash[season].each do |key, value|
        #puts holiday_hash[season][key]
        supplies_to_return << holiday_hash[season][key]

      end
    end
  end
  #puts supplies_to_return[2]
  # supplies_to_return.each do |value|
  #   puts supplies_to_return[value]
  # end
  supplies_to_return.flatten
  #supplies_to_return

end

def all_supplies_in_holidays(holiday_hash)
  # iterate through holiday_hash and print items such that your readout resembles:
  # Winter:
  #   Christmas: Lights, Wreath
  #   New Years: Party Hats
  # Summer:
  #   Fourth Of July: Fireworks, BBQ
  # etc.

  string_to_print = ""
  holiday_hash.each do |season, value|
    #print "SEASON\n"

    string_to_print += "#{season.capitalize}:\n"
    holiday_hash[season].each do |holiday, value|
      #print "HOLIDAY\n"
      if "#{holiday}".include? "_"
        string_to_print += "  #{holiday}:".gsub!(/_/, ' ').split(/ |\_/).map(&:capitalize).join(" ")
      else
        string_to_print += "  #{holiday}:".split(/ |\_/).map(&:capitalize).join(" ")
      end
      holiday_hash[season][holiday].each do |value|
        #print "VALUE\n"
        if value == holiday_hash[season][holiday].last
          string_to_print += " #{value}\n"
        else
          string_to_print += " #{value},"

        end
        #print "#{value}\n"
      end
    end

  end
  puts string_to_print
  #PRINTS WILL FAIL WHICH MEANS THE FIRST RSPEC TEST IS USELESS, WHY WOULD I USE PUTS WHEN I NEED TO CONTROL THE NEW LINES?????
  #GOT STUCK ON THIS FOR AN HOUR AND IT WAS POOR TEST SETUPS NOT USER ERROR

end

def all_holidays_with_bbq(holiday_hash)
  # return an array of holiday names (as symbols) where supply lists
  # include the string "BBQ"
  array_to_return = []
  holiday_hash.each do |season, value|
    holiday_hash[season].each do |holiday, value|
      if value.include? "BBQ"
        array_to_return << holiday
      end
    end
  end
array_to_return
end

all_holidays_with_bbq(holiday_hash)
