# Write your code here!
require "pry"
#step 1 build the hash
def game_hash
  hash = {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black","White"],
      :players => {
        "Alan Anderson": {
          :number => 0,
          :shoe => 16,
          :points => 22,
          :rebounds => 12,
          :assists => 12,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 1
        },
        "Reggie Evans": {
          :number => 30,
          :shoe => 14,
          :points => 12,
          :rebounds => 12,
          :assists => 12,
          :steals => 12,
          :blocks => 12,
          :slam_dunks => 7
        },
        "Brook Lopez": {
          :number => 11,
          :shoe => 17,
          :points => 17,
          :rebounds => 19,
          :assists => 10,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 15
        },
        "Mason Plumlee": {
          :number => 1,
          :shoe => 19,
          :points => 26,
          :rebounds => 12,
          :assists => 6,
          :steals => 3,
          :blocks => 8,
          :slam_dunks => 5
        },
        "Jason Terry": {
          :number => 31,
          :shoe => 15,
          :points => 19,
          :rebounds => 2,
          :assists => 2,
          :steals => 4,
          :blocks => 11,
          :slam_dunks => 1
        }
      }
    },
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise","Purple"],
      :players => {
        "Jeff Adrien": {
          :number => 4,
          :shoe => 18,
          :points => 10,
          :rebounds => 1,
          :assists => 1,
          :steals => 2,
          :blocks => 7,
          :slam_dunks => 2
        },
        "Bismak Biyombo": {
          :number => 0,
          :shoe => 16,
          :points => 12,
          :rebounds => 4,
          :assists => 7,
          :steals => 7,
          :blocks => 15,
          :slam_dunks => 10
        },
        "DeSagna Diop": {
          :number => 2,
          :shoe => 14,
          :points => 24,
          :rebounds => 12,
          :assists => 12,
          :steals => 4,
          :blocks => 5,
          :slam_dunks => 5
        },
        "Ben Gordon": {
          :number => 8,
          :shoe => 15,
          :points => 33,
          :rebounds => 3,
          :assists => 2,
          :steals => 1,
          :blocks => 1,
          :slam_dunks => 0
        },
        "Brendan Haywood": {
          :number => 33,
          :shoe => 15,
          :points => 6,
          :rebounds => 12,
          :assists => 12,
          :steals => 22,
          :blocks => 5,
          :slam_dunks => 12
        }
      }
    }
  }
end

#step 2 build methods
#2.1 number of points scored by each player
def num_points_scored(player_name)

game_hash.each do |location, team_data|
    team_data.each do |attribute, values|
        if attribute == :players
          values.each do |person, data|
              if person.to_s == player_name
              return game_hash[location][:players][person][:points]
            end
          end
        end
    end
  end
end

#num_points_scored("Jeff Adrien")
#10

#2.2 shoe size of each player
def shoe_size(player_name)
  game_hash.each do |location, team_data|
      team_data.each do |attribute, values|
          if attribute == :players
            values.each do |person, data|
                if person.to_s == player_name
                return game_hash[location][:players][person][:shoe]
              end
            end
          end
      end
    end
end

#shoe_size("Jeff Adrien")
#18

#2.3 return team colors, only iterate 1 level

def team_colors(team)
  game_hash.each do |location, team_data|
    if team_data[:team_name] == team
    return team_data[:colors]
    end
  end
end

#team_colors("Brooklyn Nets")

#2.4 return team names
def team_names
  output =[]
  game_hash.each do |location, team_data|
    output.push(team_data[:team_name])
  end
  output
end

#team_names


#2.5 input team name return array of number of all players

def player_numbers(team)
  output = []
  hash = game_hash
  hash.each do |location, team_data|
    if team == game_hash[location][:team_name]
        hash[location][:players].each do |name, stats|
          output.push(stats[:number])
        end
      end
    end
  return output
end

#player_numbers("Charlotte Hornets")

#2.6 return player_name data

def player_stats(player_name)
  game_hash.each do |location, team_data|
      team_data.each do |attribute, values|
          if attribute == :players
            values.each do |person, data|
                if person.to_s == player_name
                return game_hash[location][:players][person]
              end
            end
          end
      end
    end
end

#player_stats("Alan Anderson")

#2.7 returns the number of rebounds of the player with the biggest shoe size
def big_shoe_rebounds
  hash = game_hash
  #first find largest shoe size
  max_size = 0
  hash.each do |location, team_data|

    hash[location][:players].each do |name, values|
        if hash[location][:players][name][:shoe] > max_size
        max_size = hash[location][:players][name][:shoe]
        end
    end
  end

  #then return the player's number of rebounds
  hash.each do |location, team_data|
    hash[location][:players].each do |name, values|
          if hash[location][:players][name][:shoe] == max_size
          return hash[location][:players][name][:rebounds]
          end
    end
  end

end

big_shoe_rebounds
