require File.join(File.dirname(__FILE__), "..", "spec_helper")

describe SafeYAML::Transform::ToTime do
  # YAML don't parse times prior to 1.9.
  if RUBY_VERSION >= "1.9.2"
    it "returns true when the value matches a valid Time" do
      subject.transform?("2013-01-01 10:00:00")[0].should == true
    end
  end

  it "returns false when the value does not match a valid Time" do
    subject.transform?("not a time").should be_false
  end

  it "returns false when the beginning of a line does not match a Time" do
    subject.transform?("NOT A TIME\n2013-01-01 10:00:00").should be_false
  end
end
