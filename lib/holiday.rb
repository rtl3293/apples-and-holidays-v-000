require 'pry'
holiday_hash = {
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
  holiday_hash[:summer][:fourth_of_july][1]
  # return the second element in the 4th of July array
end

def add_supply_to_winter_holidays(holiday_hash, supply)
  # holiday_hash is identical to the one above
  # add the second argument, which is a supply, to BOTH the
  # Christmas AND the New Year's arrays
  holiday_hash[:winter].each do |holiday, supplies|
    supplies << supply
  end
end


def add_supply_to_memorial_day(holiday_hash, supply)
  # again, holiday_hash is the same as the ones above
  # add the second argument to the memorial day array
  holiday_hash[:spring].each do |holiday, supplies|
    supplies << supply
  end
end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  # code here
  # remember to return the updated hash
  holiday_hash[season][holiday_name] = supply_array
  holiday_hash
end

def all_winter_holiday_supplies(holiday_hash)
  # return an array of all of the supplies that are used in the winter season
  holiday_hash[:winter].values.flatten
end

def all_supplies_in_holidays(holiday_hash)
  output_text = ""
  # iterate through holiday_hash and print items such that your readout resembles:
  # Winter:
  #   Christmas: Lights, Wreath
  #   New Years: Party Hats
  # Summer:
  #   Fourth Of July: Fireworks, BBQ
  # etc.
  holiday_hash.each do |season, holiday|
    season = season.to_s
    season.capitalize!
    season << ":\n"
    output_text += season
    keys = holiday.keys
    holiday.each do |holiday_key, supplies|
      holiday_key = holiday_key.to_s
      if holiday_key.include?("_")
        split_holiday = holiday_key.split("_")
        split_holiday.each do |day|
          day.capitalize!
        end
        holiday_key = split_holiday.join(" ")
        holiday_key << ": "
        output_text += "  " + holiday_key.chomp
      else
        holiday_key.capitalize!
        holiday_key << ": "
        output_text += "  " + holiday_key.chomp
      end
      if supplies.length > 1
        supplies[1].prepend(", ")
        supplies.each do |supply|
          output_text += supply
        end
        if keys.last == holiday_key
          output_text += "\n "
        else
          output_text += "\n"
        end
      else
        output_text += supplies[0] + "\n"
      end
    end
  end
  puts output_text
end

def all_holidays_with_bbq(holiday_hash)
  # return an array of holiday names (as symbols) where supply lists
  # include the string "BBQ"
  bbq_holidays = []
  holiday_hash.each do |season, holidays|
    #binding.pry
    holidays.each do |day, supplies|
      if supplies.include?("BBQ")
        bbq_holidays << day
      end
    end
  end
  bbq_holidays
end

all_holidays_with_bbq(holiday_hash)
