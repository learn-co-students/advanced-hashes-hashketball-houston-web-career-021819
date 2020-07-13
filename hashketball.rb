require 'pry'

def game_hash ()
  hashketball = {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: {
        :Alan_Anderson => {
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1,
        },
        :Reggie_Evans => {
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7,
        },
        :Brook_Lopez => {
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15,
        },
        :Mason_Plumlee => {
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 12,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5,
        },
        :Jason_Terry => {
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1,
        }
      },
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: {
        :Jeff_Adrien => {
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2,
        },
        :Bismak_Biyombo => {
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 7,
          blocks: 15,
          slam_dunks: 10,
        },
        :DeSagna_Diop => {
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5,
        },
        :Ben_Gordon => {
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0,
        },
        :Brendan_Haywood => {
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 22,
          blocks: 5,
          slam_dunks: 12,
        }
      }
    }
  }
end

def num_points_scored (player_name)
  player_name_with_underscores = player_name.sub " ", "_"
  player_name_symbol = :"#{player_name_with_underscores}"
  game_hash.each do |home_away, home_away_values|
    home_away_values.each do |high_level, info|
      if high_level == :players
        info.each do |player_names, player_stats|
          if player_names == player_name_symbol
            return player_stats[:points]
            break
          end
        end
      end
    end
  end
end

  
def shoe_size (player_name)
  player_name_with_underscores = player_name.sub " ", "_"
  player_name_symbol = :"#{player_name_with_underscores}"
  game_hash.each do |home_away, home_away_values|
    home_away_values.each do |high_level, info|
      if high_level == :players
        info.each do |player_names, player_stats|
          if player_names == player_name_symbol
            return player_stats[:shoe]
            break
          end
        end
      end
    end
  end
end


def team_colors (team_name)
  check_val = false
  game_hash.each do |home_away, home_away_values|
    home_away_values.each do |high_level, info|
      if check_val == true                    #a then next time it iterates, it outputs color
          return info
      elsif high_level == :team_name          
        if info == team_name             #when this line sees the correct team name
          check_val = true                  #it sets a check value to true
        end
      end
    end
  end
end  
  
def team_names ()
  team_names_array = []
  game_hash.each do |home_away, home_away_values|
    home_away_values.each do |high_level, info|
      if high_level == :team_name 
        team_names_array << info 
      end
    end
  end
  team_names_array
end    
  
def player_numbers (team_name)
  player_number_array = []
  check_val = 0
  game_hash.each do |home_away, home_away_values|
    home_away_values.each do |high_level, info|
      if check_val == 1
        check_val += 1
      elsif check_val == 2
        info.each do |players, player_stats|
          player_stats.each do |stat_key, stat_value|
            if stat_key == :number
              player_number_array << stat_value
            end
          end
        end
        sorted_player_number_array = player_number_array.sort
        return sorted_player_number_array
      elsif high_level == :team_name
        if info == team_name
          check_val = 1
        end
      end
    end
  end
end

  
def player_stats (player_name)
  player_name_with_underscores = player_name.sub " ", "_"
  player_name_symbol = :"#{player_name_with_underscores}"
  game_hash.each do |home_away, home_away_values|
    home_away_values.each do |high_level, info|
      if high_level == :players
        info.each do |player_names, player_stats|
          if player_names == player_name_symbol
            return player_stats
            break
          end
        end
      end
    end
  end
end
  
def big_shoe_rebounds ()
  
  biggest_shoe = 0
  big_shoe_rebounds = 0
    
  game_hash.each do |home_away, home_away_values|
    home_away_values.each do |high_level, info|
      if high_level == :players
        info.each do |player_names, player_stats|
          upgrade = 0
          player_stats.each do |stat, value|
            if stat == :shoe
              if value > biggest_shoe
                biggest_shoe = value
                upgrade = 1
              end
            elsif stat == :rebounds && upgrade ==1
              big_shoe_rebounds = value
            end
          end
        end
      end
    end
  end
  return big_shoe_rebounds
end
  