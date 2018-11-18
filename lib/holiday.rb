require 'pry'

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
  holiday_supplies[:summer][:fourth_of_july][1]
end

def add_supply_to_winter_holidays(holiday_hash, supply)
  # holiday_hash is identical to the one above
  # add the second argument, which is a supply, to BOTH the
  # Christmas AND the New Year's arrays
  holiday_hash.each do |k,v|
    if k == :winter
      v.each do |k1,v2|
        holiday_hash[k][k1] << supply
      end
    end 
  end

end


def add_supply_to_memorial_day(holiday_hash, supply)
  # again, holiday_hash is the same as the ones above
  # add the second argument to the memorial day array
  holiday_hash.each do |k,v|
    if k == :spring
      v.each do |k1,v2|
        holiday_hash[k][k1] << supply
      end
    end 
  end

end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  # code here
  # remember to return the updated hash
  holiday_hash[season][holiday_name] = supply_array

end

def all_winter_holiday_supplies(holiday_hash)
  # return an array of all of the supplies that are used in the winter season
  supply = []
  holiday_hash.each do |k,v|
    if k == :winter
      v.each do |k1,v1|
        supply << v1
      end
    end 
  end
  supply.flatten!
end

def all_supplies_in_holidays(holiday_hash)
  # iterate through holiday_hash and print items such that your readout resembles:
  # Winter:
  #   Christmas: Lights, Wreath
  #   New Years: Party Hats
  # Summer:
  #   Fourth Of July: Fireworks, BBQ
  # etc.
  holiday_hash.each do |k,v|
    puts "#{k}".capitalize + ":"
      v.each do |k1,v1|
        arr1 = k1.to_s.split("_")
        arr2 = arr1.collect{|words|words.capitalize}
        y = "  " + arr2.join(" ") + ":"
        print y

        x =" "
        v1.each_with_index do |element,i|
          if i <v1.length - 1
           print x+element+ ","
          else
           print x+element
          end
        end
        puts
      end
  end

end

def all_holidays_with_bbq(holiday_hash)
  # return an array of holiday names (as symbols) where supply lists
  # include the string "BBQ"
  holis = []
  holiday_hash.each do |k,v|
      v.each do |k1,v1|
        if v1.include?("BBQ")
          holis << k1
        end
      end 
  end
  return holis
end







