Given /^a repo with url "([^"]*)"$/ do |url|
  @repo = DebsFromRepos::ListUrls.new(url)
end

Given /^a repo with url "([^"]*)", a suite "([^"]*)" and a component called "([^"]*)" altogether$/ do |url, suite, component|
  @repo = DebsFromRepos::ListUrls.new(url,
                                      suite,
                                      component
                                     )
end

Given /^which suite is "([^"]*)"$/ do |suite|
  @repo.suite << suite
end

Given /^one single component called "([^"]*)"$/ do |component|
  @repo.component << component
end

When /^ask for the full url$/ do
  @urls = @repo.get_url
end

Then /^I should get "([^"]*)"$/ do |full_url|
  @urls.should include full_url
end

Then /^I should get nil$/ do
  @urls.should be_nil
end

Then /^I should be get an error message: "([^"]*)"$/ do |message|
  pending("I need to learn more about mocks and stubs")  # express the regexp above with the code you wish you had
end
