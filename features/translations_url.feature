Feature: List translations url from a Debian/Ubuntu repo
  In order to have the packages' info in my language of a specific Debian/Ubuntu repotory
  As a developer
  I want to get the url for the remote Translations-[LANG].gz file

  The url scheme for the translations is as follows:
  [base_url]/dist/[suite]/[component]/i18n/Translation-[LANG].gz
  i.e.: http://us.archive.ubuntu.com/ubuntu/dists/oneiric/main/i18n/Translation-es.gz


  @url @translations @es
  Scenario: Translations-es.gz URL for a repo
    Given a repo with url "http://us.archive.ubuntu.com/ubuntu"
    And which suite is "oneiric"
    And one single component called "main"
    And and "es" as a language
    When ask for the translations' url
    Then I should get "http://us.archive.ubuntu.com/ubuntu/dists/oneiric/main/i18n/Translation-es.gz"

  @url @translations @es
  Scenario: Translations-es.gz URL for a repo passing the language as parameter
    Given a repo with url "http://us.archive.ubuntu.com/ubuntu"
    And which suite is "oneiric"
    And one single component called "main"
    When ask for the translations' url passing the language "es" as parameter
    Then I should get "http://us.archive.ubuntu.com/ubuntu/dists/oneiric/main/i18n/Translation-es.gz"

  @url @translations @it
  Scenario: Translations-it.gz URL for a repo
    Given a repo with url "http://us.archive.ubuntu.com/ubuntu"
    And which suite is "oneiric"
    And one single component called "main"
    And and "it" as a language
    When ask for the translations' url
    Then I should get "http://us.archive.ubuntu.com/ubuntu/dists/oneiric/main/i18n/Translation-it.gz"

  @url @translations @es @fail
  Scenario: Translations URL for a repo but without give the language
    Given a repo with url "http://us.archive.ubuntu.com/ubuntu"
    And which suite is "oneiric"
    And one single component called "main"
    When ask for the translations' url
    Then I should get nil 
    And I should get an error message: "ERROR: no language has been selected"

  @url @translations @fail
  Scenario Outline: Bad language for the Translations URL
    Given a repo with url "http://us.archive.ubuntu.com/ubuntu"
    And which suite is "oneiric"
    And one single component called "main"
    And and "<lang>" as a language
    When ask for the translations' url
    Then I should get nil 
    And I should get an error message: "ERROR: the language is wrong"

    Examples:
        | lang    |
        | ES      |
        | Spanish |
        | es_ES   |

  @url @translations @altogether
  Scenario: URL for a repo with the suite, the component and the language passed as arguments
    Given a repo with url "http://us.archive.ubuntu.com/ubuntu", a suite "oneiric", a component called "main" and language "es" altogether
    When ask for the translations' url
    Then I should get "http://us.archive.ubuntu.com/ubuntu/dists/oneiric/main/i18n/Translation-es.gz"
