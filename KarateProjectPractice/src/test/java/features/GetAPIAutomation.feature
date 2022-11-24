Feature: Testing of Get API calls

Background:
Given url baseURL

# simple status check
Scenario: Simple test of response
When method GET
Then status 200

# simple check if response contains 4127
Scenario: Usage of match keyword
When method GET
Then status 200
And  def myresponse = response
And print myresponse 
And match myresponse[1].id == 4127

# check if response contains data as 4129 -- using contains keyword
Scenario: Usage of contains keyword
When method GET
Then status 200
And  def myresponse = response
And print myresponse 
And match myresponse[*].id contains 4129

#Check with path parameters -- with path keyword
Scenario: Using path parameter
Given path '/4129'
When method GET
Then status 200
And  def myresponse = response
And print myresponse 
And match response.id == 4129

#Using query parameter
Scenario: Check query parameter
* def queryParameter = {name:'Chapal Pilla'}
Given params queryParameter
When method GET
Then print response
And match response[0].id == 4119

#Using header parameter -- option1 -- single header
Scenario: Check headers1
#*def request_headers = {Connection:'keep-alive'}
#{Authorization: 'Bearer fe69f912653075d66540a98a2f55afeb4539bb0d42d899ad79c7b2d1d7bdafd7'}
Given header Connection = 'keep-alive'
When method GET
Then print response

#Using headers parameter -- option2 -- using a variable
Scenario: Check headers2 -- multiple headers in a variable
* def request_headers = {Connection:'keep-alive', Authorization: 'Bearer fe69f912653075d66540a98a2f55afeb4539bb0d42d899ad79c7b2d1d7bdafd7' }
Given headers request_headers
When method GET
Then print response

Scenario: Check headers with configure option
* configure headers = {Connection:'keep-alive', Authorization: 'Bearer fe69f912653075d66540a98a2f55afeb4539bb0d42d899ad79c7b2d1d7bdafd7' }
When method GET
Then print response
















