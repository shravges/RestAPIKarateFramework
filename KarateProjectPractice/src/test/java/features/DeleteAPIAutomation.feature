Feature: Test Delete API call

Scenario: Delete User
* def request_headers = {Connection:'keep-alive', Authorization: 'Bearer fe69f912653075d66540a98a2f55afeb4539bb0d42d899ad79c7b2d1d7bdafd7' }
Given url 'https://gorest.co.in/public/v2/users'
And headers request_headers
And path '/2949'
When method delete
Then status 204

