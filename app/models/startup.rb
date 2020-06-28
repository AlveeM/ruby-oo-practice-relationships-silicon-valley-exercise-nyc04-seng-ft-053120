class Startup
  attr_reader :name, :founder, :domain

  BILLION = 1_000_000_000
  @@all = []

  def initialize(name, founder, domain)
    @name = name 
    @founder = founder
    @domain = domain 
    @@all << self 
  end

  def pivot(name)
    @domain = name 
  end

  def sign_contract(venture_capitalist, type, investment)
    FundingRound.new(self, venture_capitalist, type, investment)
  end

  def funding_rounds 
    FundingRound.all.select { |round| round.startup == self }
  end

  def num_funding_rounds
    self.funding_rounds.length
  end

  def total_funds
    self.funding_rounds.reduce(0) { |sum, round| sum += round.investment }
  end

  def investors
    self.funding_rounds.map { |round| round.venture_capitalist }.uniq
  end

  def big_investors
    self.investors.select { |investor| investor.total_worth > BILLION }
  end

  def self.find_by_founder(founder_name)
    self.all.find { |startup| startup.founder == founder_name }
  end

  def self.domains
    self.all.map { |startup| startup.domain }.uniq
  end

  def self.all 
    @@all
  end
end
