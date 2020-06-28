require 'pry'
class VentureCapitalist
  attr_reader :name, :total_worth

  BILLION = 1_000_000_000
  @@all = []

  def initialize(name, total_worth)
    @name = name
    @total_worth = total_worth
    @@all << self
  end

  def offer_contract(startup, type, investment)
    FundingRound.new(startup, self, type, investment)
  end

  def funding_rounds
    FundingRound.all.select { |round| round.venture_capitalist == self }
  end

  def funding_rounds_in_domain(domain)
    FundingRound.all.select do |round| 
      round.venture_capitalist == self  &&
      round.startup.domain == domain
    end
  end

  def portfolio
    self.funding_rounds.map { |round| round.startup }.uniq
  end

  def biggest_investment
    self.funding_rounds.max_by { |round| round.investment }
  end

  def invested(domain)
    self.funding_rounds_in_domain(domain).reduce(0) { |sum, round| sum += round.investment }
  end

  def self.tres_commas_club
    binding.pry
    self.all.select { |vc| vc.total_worth > BILLION}
  end

  def self.all 
    @@all 
  end
end
