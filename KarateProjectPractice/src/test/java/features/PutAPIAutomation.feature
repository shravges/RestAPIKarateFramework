Feature: Test Put API call

Background:
Given def requestpayload = 
"""
{
"status": "active"
}
"""
And def headervalue = {Authorization: 'Bearer fe69f912653075d66540a98a2f55afeb4539bb0d42d8xxxxxxxxxx99ad79c7b2d1d7bdafd7'}


Scenario: Check if user details are getting updated
* def request_headers = {Connection:'keep-alive', Authorization: 'Bearer fe69f912653075d66540a98a2f55afeb4539bb0d42d899ad79c7b2d1d7bdafd7' }
Given url 'https://gorest.co.in'
And headers request_headers 
And path '/public/v2/users/2821'
And request requestpayload
When method put
Then status 200
And print response

