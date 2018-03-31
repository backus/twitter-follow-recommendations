require 'pathname'

username = ARGV.fetch(0) { fail 'Pass in your username!' }

# Load up list of currated favorites
favorites_list = Pathname.new('favorites.txt')

# Create a glob for followings files for each of these people
followings = Pathname.glob('./data/followings/*.txt')

# Load up people we already follow
me = Pathname.new("./data/followings/#{username}.txt")

others = followings - [me]

others_followings =
  others.map do |path|
    [path.sub_ext('').to_s.sub(/\A\.\//, ''), path.read.split("\n").sort]
  end

mine = me.read.split("\n").sort

without_people_i_know =
  others_followings.map do |(person, following)|
    [person, following - mine]
  end

puts without_people_i_know.flat_map { |(person, following)| following }.sort
