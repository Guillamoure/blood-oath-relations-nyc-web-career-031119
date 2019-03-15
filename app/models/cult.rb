class Cult
  attr_reader :name, :location, :founding_year
  attr_accessor :slogan

  @@all = []

  def initialize(name, location, founding_year, slogan)
    @name = name
    @location = location
    @founding_year = founding_year
    @slogan = slogan
    @@all << self
  end

  def recruit_follower(follower)
    BloodOath.new(self, follower)
  end

  def all
    BloodOath.all.select do |cults|
      cults.cult == self
    end
  end

  def self.all
      @@all
  end

  def cult_population
    self.all.length
  end

  def self.find_by_name(name)
    self.all.find do |cults|
      cults.name == name
    end
  end

  def self.find_by_location(location)
    self.all.select do |cults|
      cults.location == location
    end
  end

  def self.find_by_founding_year(year)
    self.all.select do |cults|
      cults.founding_year == year
    end
  end

  def average_age
    total = []
    BloodOath.all.each do |variable|
      if variable.cult == self
      total << variable.follower.age
    end
    end
    total.inject {|sum, el| sum + el }.to_f / total.size
  end

  end
