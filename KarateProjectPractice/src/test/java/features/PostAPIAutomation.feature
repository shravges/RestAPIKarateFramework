Feature: Test POST API call

Background:
Given def requestpayload = read('classpath:resources/PostCallRequestBody.json')
Then print requestpayload

Scenario: Test post api call with request body
Given url 'https://gorest.co.in/public/v2/users'
And header Authorization = 'Bearer fe69f912653075d66540a98a2f55afeb4539bb0d42d899ad79c7b2d1d7bdafd7'
And request requestpayload
When method post
Then status 201
And print response
And match response.id == '#present'




