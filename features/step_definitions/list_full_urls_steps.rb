Given /^a repo with url "([^"]*)"$/ do |url|
  @repo = DebsFromRepos::ListUrls.new(url)
end

Given /^a repo with url "([^"]*)", a suite "([^"]*)" and a component called "([^"]*)" altogether$/ do |url, suite, component|
  @repo = DebsFromRepos::ListUrls.new(url,
                                      [suite],
                                      [component]
                                     )
end

Given /^a repo with url "([^"]*)", a suites "([^"]*)" and "([^"]*)" and two components called "([^"]*)" and "([^"]*)" altogether$/ do |url, suite1, suite2, component1, component2|
  @repo = DebsFromRepos::ListUrls.new(url,
                                      [suite1, suite2],
                                      [component1, component2]
                                     )
end

Given /^which suite is "([^"]*)"$/ do |suite|
  @repo.suites << suite
end

Given /^which suites are "([^"]*)" and "([^"]*)"$/ do |suite1, suite2|
  @repo.suites = [suite1, suite2]
end

Given /^one single component called "([^"]*)"$/ do |component|
  @repo.components << component
end

When /^ask for the full url$/ do
  @urls = @repo.get_urls
end

Then /^I should get "([^"]*)"$/ do |full_url|
  @urls.should include full_url
end

Given /^two components called "([^"]*)" and "([^"]*)"$/ do |component1, component2|
  @repo.components = [component1, component2]
end

Then /^"([^"]*)"$/ do |full_url|
  @urls.should include full_url
end
