require 'rspec'
require_relative 'pw_cracker'


# 112233 meets these criteria because the digits never decrease and all repeated digits
# are exactly two digits long.
# 123444 no longer meets the criteria (the repeated 44 is part of a larger group of 444).
# 111122 meets the criteria (even though 1 is repeated more than twice, it still contains
# a double 22).
describe 'day4.2 tests' do
  it "tries 112233" do
    input = "112233-112233"
    output = 1
    expect(pw_cracker_2(input)).to eq(output)
  end

  it "tries 123444" do
    input = "123444-123444"
    output = 0
    expect(pw_cracker_2(input)).to eq(output)
  end

  it "tries 111122" do
    input = "111122-111122"
    output = 1
    expect(pw_cracker_2(input)).to eq(output)
  end

  it "tries 223456" do
    input = "223456-223456"
    output = 1
    expect(pw_cracker_2(input)).to eq(output)
  end

  it "tries 122234" do
    input = "122234-122234"
    output = 0
    expect(pw_cracker_2(input)).to eq(output)
  end

  it "tries 122345" do
    input = "122345-122345"
    output = 1
    expect(pw_cracker_2(input)).to eq(output)
  end

  it "tries 126678" do
    input = "126678-126678"
    output = 1
    expect(pw_cracker_2(input)).to eq(output)
  end

  it "tries 123668" do
    input = "123668-123668"
    output = 1
    expect(pw_cracker_2(input)).to eq(output)
  end

  it "tries 123455" do
    input = "123455-123455"
    output = 1
    expect(pw_cracker_2(input)).to eq(output)
  end

  it "tries 111111" do
    input = "111111-111111"
    output = 0
    expect(pw_cracker_2(input)).to eq(output)
  end

  it "tries 123789" do
    input = "123789-123789"
    output = 0
    expect(pw_cracker_2(input)).to eq(output)
  end

  it "tries 113444" do
    input = "113444-113444"
    output = 1
    expect(pw_cracker_2(input)).to eq(output)
  end

  it "does day 4.1" do
    input = "193651-649729"
    output = 1102
    expect(pw_cracker_2(input)).to eq(output)
  end
end
