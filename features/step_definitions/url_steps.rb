Before do
  @orig_stderr = $stderr
  $stderr = StringIO.new
end

Given /^a repo with url "([^"]*)"$/ do |url|
  @repo = DebsFromRepos::ListUrl.new(url)
end

Given /^which suite is "([^"]*)"$/ do |suite|
  @repo.suite << suite
end

Given /^one single component called "([^"]*)"$/ do |component|
  @repo.component << component
end

Given /^and "([^"]*)" as a language$/ do |lang|
  @repo.lang = lang
end

Given /^a repo with url "([^"]*)", a suite "([^"]*)" and a component called "([^"]*)" altogether$/ do |url, suite, component|
  @repo = DebsFromRepos::ListUrl.new(url, suite, component)
end

Given /^a repo with url "([^"]*)", a suite "([^"]*)", a component called "([^"]*)" and language "([^"]*)" altogether$/ do |url, suite, component, lang|
  @repo = DebsFromRepos::ListUrl.new(url, suite, component, lang)
end

When /^ask for the full url$/ do
  @url = @repo.get_packages_url
end

When /^ask for the translations' url$/ do
  @url = @repo.get_translations_url
end

When /^ask for the translations' url passing the language "([^"]*)" as parameter$/ do |lang|
  @url = @repo.get_translations_url(lang)
end

Then /^I should get "([^"]*)"$/ do |full_url|
  @url.should include full_url
end

Then /^I should get nil$/ do
  @url.should be_nil
end

Then /^I should get an error message: "([^"]*)"$/ do |message|
  $stderr.rewind
  $stderr.string.chomp.should == message
end

After do
  $stderr = @orig_stderr
end
