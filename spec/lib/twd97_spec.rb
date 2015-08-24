require "spec_helper"

describe Twd97 do
  describe ".convert" do
    example "1" do
      coordinates = described_class.convert(302745.088, 2771185.18)
      expect( coordinates[:lat].round(6) ).to eq 25.047902
      expect( coordinates[:lng].round(6) ).to eq 121.522737
    end
    example "2" do
      coordinates = described_class.convert("304225.666", 2769534.8)
      expect( coordinates[:lat].round(6) ).to eq 25.032950
      expect( coordinates[:lng].round(6) ).to eq 121.537345
    end
  end
end
