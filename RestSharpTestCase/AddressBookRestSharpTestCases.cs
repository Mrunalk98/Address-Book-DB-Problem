using AddressBookSystemProblem;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using RestSharp;
using System.Collections.Generic;
using System.Net;

namespace RestSharpTestCase
{
    [TestClass]
    public class AddressBookRestSharpTestCases
    {
        RestClient client;

        [TestInitialize]
        public void SetUp()
        {
            client = new RestClient("http://localhost:4000");
        }

        private IRestResponse GetAddressList()
        {
            // arrange
            RestRequest request = new RestRequest("/addresses", Method.GET);

            // act
            IRestResponse response = client.Execute(request);
            return response;
        }

        [TestMethod]
        public void OnCallingGETApi_ReturnAddressList()
        {
            IRestResponse response = GetAddressList();

            // assert
            Assert.AreEqual(response.StatusCode, HttpStatusCode.OK);
            List<AddressBook> dataResponse = JsonConvert.DeserializeObject<List<AddressBook>>(response.Content);
            Assert.AreEqual(3, dataResponse.Count);
        }

        [TestMethod]
        public void GivenAddressBook_DoPost_ShouldReturnAddedAddressDetails()
        {
            // arrange
            RestRequest request = new RestRequest("/addresses", Method.POST);
            JObject objectBody = new JObject();
            objectBody.Add("FirstName", "Johnny");
            objectBody.Add("LastName", "Tyler");
            objectBody.Add("Address", "20th Street");
            objectBody.Add("City", "Riverside");
            objectBody.Add("State", "SD");
            objectBody.Add("Zip", "91240");
            objectBody.Add("PhoneNumber", "8569541589");
            objectBody.Add("Email", "ste@abc.com");

            request.AddParameter("application/json", objectBody, ParameterType.RequestBody);

            // act
            IRestResponse response = client.Execute(request);

            // assert
            Assert.AreEqual(response.StatusCode, HttpStatusCode.Created);
            AddressBook dataResponse = JsonConvert.DeserializeObject<AddressBook>(response.Content);
            Assert.AreEqual("Johnny", dataResponse.FirstName);
            Assert.AreEqual("Tyler", dataResponse.LastName);
            Assert.AreEqual("20th Street", dataResponse.Address);
            Assert.AreEqual("Riverside", dataResponse.City);
            Assert.AreEqual("SD", dataResponse.State);
            Assert.AreEqual("91240", dataResponse.Zip);
            Assert.AreEqual("8569541589", dataResponse.PhoneNumber);
            Assert.AreEqual("ste@abc.com", dataResponse.Email);
        }

    }
}
