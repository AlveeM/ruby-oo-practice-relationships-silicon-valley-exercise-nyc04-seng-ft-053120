require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

s1 = Startup.new("Twitter", "Jack", "social")
s2 = Startup.new("SpaceX", "Elon", "space")
s3 = Startup.new("FB", "Mark", "social")

vc1 = VentureCapitalist.new("Warren", 90_000_000_000)
vc2 = VentureCapitalist.new("Russ", 1_000_000_000)
vc3 = VentureCapitalist.new("John", 900_000_000)

s1.sign_contract(vc1, "Seed", 1_000_000)
s1.sign_contract(vc3, "Seed", 200_000)
s2.sign_contract(vc2, "Series A", 500_000)
s2.sign_contract(vc1, "Series B", 10_000_000)
s3.sign_contract(vc1, "Series C", 12_000_000)

binding.pry
0 #leave this here to ensure binding.pry isn't the last line