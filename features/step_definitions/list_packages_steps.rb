Given /^a Packages\.gz file with url "([^"]*)"$/ do |url|
  @packages_url = url
end

Given /^a bad url "([^"]*)"$/ do |url|
  @packages_url = url
end

Given /^a Translations\-(?:es|it)\.gz file with url "([^"]*)"$/ do |url|
  @translations_url = url
end

Given /^no Translations' url file$/ do
  @translations_url = nil
end

When /^ask for a list of packages$/ do
  if @translations_url
    @packages = DebsFromRepos::Packages.new(@packages_url, @translations_url)
  else
    @packages = DebsFromRepos::Packages.new(@packages_url)
  end
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
