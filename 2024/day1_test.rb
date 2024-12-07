require 'rspec'
require_relative './day1'

describe Day1 do
  describe "test" do

    before do
      # @d = Day1.new('./day1-test.dat')
      @d = Day1.new('./day1.dat')
    end

    describe "run" do
      it "runs" do
        puts "running"
        @d.run
      end

    end
  end
end
