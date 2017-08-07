@Team-Infra
@Web-bat-tier-1
Feature: User Access RestRef path then Goes to OT Site and makes Reso in different RID Verify Attribution values

  Background:
  # Add setup steps to run before each Scenario
    Then I start with a new browser
  @Attribution
  @Attribution-RestRef-to-OT-SameRID

  Scenario Outline:  User visits Restaurants site using single.aspx then access Opentable Site and makes a reservation
  using same RID. Verify points and attribution values
  Points = 0 , BillingType = RestRefReso, PrimarySourceType =  RestREf
  Manual Case(s): RestRef to OT Same RID - Make


    Given I set test domain to "<domain>"
    Then I navigate to url "<Restref_URL>"
    And I click "Find a Table"
    And I navigate to url "<OT_Start_page>"
    And I set reservation date to "<days_fwd>" days from today
    And I select restaurant "<rest_name>"
    And I set party size to "<party_sz>"
    And I set reservation time to "<time>"
    And I click Find a Table Button and fill in anonymous user info
    Then I connect to database "<database>" as "<login>"
    Then I verify Attribution "BillingType" equal to "RestRefReso"
    Then I verify Attribution "PrimarySourceType" equal to "RestRef"
    Then I verify Attribution "ResPoints" equal to "0"

  @Region-NA @Domain-COM
  Scenarios:
    | domain | OT_Start_page  | Restref_URL                                                                               | rest_name       | days_fwd | party_sz | time    | database         | login               |
    | .com   | start/?m=1     | http://www.opentable.com/restaurant/profile/(COM-POP2-RID)/reserve?restref=(COM-POP2-RID)  | (COM-POP2-Name) |   2      | 2 people | 7:00 PM | webdb-na-primary | automation/aut0m8er |

  @Region-EU @Domain-CO.UK
  Scenarios:
    | domain | OT_Start_page  | Restref_URL                                                                                   | rest_name        | days_fwd | party_sz | time  | database         | login               |
    | .co.uk | start/?m=1     | http://www.opentable.co.uk/srestaurant/profile/(COUK-POP2-RID)/reserve?restref=(COUK-POP2-RID) | (COUK-POP2-Name) |    2     | 2 people | 19:00 | webdb-eu-primary | automation/aut0m8er |