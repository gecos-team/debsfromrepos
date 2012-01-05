Given /^a Packages\.gz file with url "([^"]*)"$/ do |url|
  @packages = DebsFromRepos::Packages.new(url)
end

When /^ask for a list of packages$/ do
  @list = @packages.names
end

Then /^I should get a list of stings$/ do
  @list.should be_a_kind_of Array
  @list.each {|e| e.should be_a_kind_of String }
end

Then /^the list should include "([^"]*)"$/ do |package|
  @list.should include package
end
