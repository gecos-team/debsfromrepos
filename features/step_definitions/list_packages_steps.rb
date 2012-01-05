Given /^a Packages\.gz file with url "([^"]*)"$/ do |url|
  @url = url
end

Given /^a bad url "([^"]*)"$/ do |url|
  @url = url
end

When /^ask for a list of packages$/ do
  @packages = DebsFromRepos::Packages.new(@url)
  @list = @packages.packages
end

Then /^I should get a empty list$/ do
  @list.should be_a_kind_of Hash
  @list.should be_empty
end

Then /^I should get a list of pairs: name and description$/ do
  @list.should be_a_kind_of Hash
  @list.each_pair do |k,v|
    k.should be_a_kind_of String
    k.should be_a_kind_of String
  end
end

Then /^the list should include "([^"]*)" with description "([^"]*)"$/ do |package, description|
  @list.keys.should include package
  @list[package].should == description
end
