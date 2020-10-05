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
  return holiday_hash[:summer][:fourth_of_july][1]
end

def add_supply_to_winter_holidays(holiday_hash, supply)
  # holiday_hash is identical to the one above
  # add the second argument, which is a supply, to BOTH the
  # Christmas AND the New Year's arrays
  holiday_hash.each do |season, holiday|
    if season == :winter
      holiday.each do | day, supplies|
        supplies.push(supply)
      end
    end
  end
end


def add_supply_to_memorial_day(holiday_hash, supply)
  # again, holiday_hash is the same as the ones above
  # add the second argument to the memorial day array
  holiday_hash[:spring][:memorial_day] = supply

end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  # code here
  # remember to return the updated hash
  holiday_hash[season][holiday_name] = supply_array
  return holiday_hash
end

def all_winter_holiday_supplies(holiday_hash)
  # return an array of all of the supplies that are used in the winter season
  return holiday_hash[:winter].values.flatten
end

def all_supplies_in_holidays(holiday_hash)
  holiday_hash = holiday_hash.transform_keys(&:to_s)
  # iterate through holiday_hash and print items such that your readout resembles:
  # Winter:
  #   Christmas: Lights, Wreath
  #   New Years: Party Hats
  # Summer:
  #   Fourth Of July: Fireworks, BBQ
  # etc.
  hollyday_string = []
  supply_string = []

  holiday_hash.each do |season, holiday|
    if season.to_s.include? " "
      season_string = season.capitalize.join + ": "
    else
      season_string = season.to_s.capitalize + ":"
    end
    puts season_string

    holiday.each do |hollyday, supplies|
      hollyday_string = []
      hollyday = Array(hollyday.to_s)

      #hollyday.each do |day|
      
        if hollyday.to_s.include? "_"
          hollyday = hollyday.join.gsub(/_/, " ").split.map(&:capitalize).join(" ")
          hollyday_string << hollyday.to_s
        else
          hollyday_string << hollyday.join.capitalize.to_s
        end
        hollyday_string = hollyday_string.join()
       
      #end
  
       supply_string = []
       supplies.each do |supply|
        
         if supply.upcase == "BBQ"
           supply_string << "BBQ"  
        
         elsif supply.to_s.include? " "
           dual_supply = supply.split.each do |word| word.capitalize
           end
           supply_string << dual_supply.join(" ").to_s
         else
           supply_string << supply.capitalize.to_s
         
         end
        
      
        
      end
      supply_string = supply_string.join(", ")
      long_ass_string = "  #{hollyday_string}: #{supply_string}"
      puts long_ass_string
    end
  end    
     
  

end

def all_holidays_with_bbq(holiday_hash)
  # return an array of holiday names (as symbols) where supply lists
  # include the string "BBQ"
   keys = []
   holiday_hash.each do |season, holiday|
     holiday.each do |hollyday, supplies|
      
     supplies.each do |supply|
        
         if supply == "BBQ"
           keys << hollyday
          
          
         end
       end
     end
    
   end
   
   return keys

  #puts holiday_hash.invert["BBQ"]
end







