Feature: Test multiple APIs together

Background:
Given def baseURL = 'https://gorest.co.in/'
And def random_string = 
"""
function(s)
{
	var text="";
	var pattern = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
	for(var i=0;i<s;i++)
	text += pattern.charAt(Math.floor(Math.random() * pattern.length()));
	return text;
}
"""
And def randomString = random_string(10);
And print randomString
And def requestpayload = read('classpath:resources/PostCallRequestBody.json')
And requestpayload.email = randomString + "@gmail.com"
And def request_headers = {Connection:'keep-alive', Authorization: 'Bearer fe69f912653075d66540a98a2f55afeb4539bb0d42d899ad79c7b2d1d7bdafd7' }
And def updatedRequestBody = 
"""
{
"status": "active"
}
"""

#create a new user and check if id is present
Scenario: Test E2E scenario for user
Given url baseURL
And path '/public/v2/users'
And header Authorization = 'Bearer fe69f912653075d66540a98a2f55afeb4539bb0d42d899ad79c7b2d1d7bdafd7'
And request requestpayload
When method post
Then status 201
And print response
And match response.id == '#present'

#get the user id created through post request
* def userid = response.id
* print userid

#check if user got created with get api call
Given url baseURL
And path 'public/v2/users/' + userid
And headers request_headers
When method GET
Then status 200
And print response 
And match response.id == userid

#update the status of the request
Given url baseURL
And headers request_headers 
And path 'public/v2/users/' + userid
And request updatedRequestBody
When method put
Then status 200
And print response
And match response.status == "active"

#delete the user which was created as a part of post request
Given url baseURL
And headers request_headers
And path 'public/v2/users/' + userid
When method delete
Then status 204
And print response

#check if the user is shown with get api call
Given url baseURL
And path 'public/v2/users/' + userid
And headers request_headers
When method GET
Then status 404
And print response 
And match response.message == "Resource not found"










