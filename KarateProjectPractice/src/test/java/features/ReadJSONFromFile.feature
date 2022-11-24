Feature: Read JSON data from file

Scenario: Compare actual response with expected response
Given url 'https://gorest.co.in/public/v2/users'
And path '/2527'
When method GET
Then status 200
And def expectedResponse = read('classpath:resources/SampleExpectedResponse.json')
And match response == expectedResponse