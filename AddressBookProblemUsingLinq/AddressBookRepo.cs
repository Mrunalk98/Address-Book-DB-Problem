using System;
using System.Collections.Generic;
using System.Data;
using System.Text;

namespace AddressBookProblemUsingLinq
{
    public class AddressBookRepo
    {
        public readonly DataTable addressBookTable = new DataTable();

        public List<AddressBook> InsertContact()
        {
            List<AddressBook> addressBooks = new List<AddressBook>()
            {
                new AddressBook() { FirstName="John", LastName="Doey", Address="120 jefferson", City="Riverside", State="NJ", Zip=80750, PhoneNumber="5896541589", Email="john@abc.com" },
                new AddressBook() { FirstName="Jack", LastName="Ginis", Address="220 hobo Av.", City="New York",  State="PA", Zip=91190, PhoneNumber="7596541589",  Email="jack@abc.com" },
                new AddressBook() { FirstName="Sam", LastName="Huges", Address="20th Street", City="SomeTown", State="PA", Zip=95750, PhoneNumber="4852541589", Email="sam@abc.com" },
                new AddressBook() { FirstName="Abc", LastName="Tyler", Address="7452 Terrace", City="Riverside", State="SD", Zip=91240, PhoneNumber="8569541589", Email="ste@abc.com" }
            };
            Console.WriteLine("Contacts added successfully");
            return addressBooks;
        }

        public void DisplayAddressBook(List<AddressBook> addressBooks)
        {
            Console.WriteLine("List of contacts in Address book : ");
            Console.WriteLine("FirstName \t LastName \t Address \t City \t\t State \t ZipCode \t PhoneNumber \t EmailID");
            foreach (var address in addressBooks)
            {
                Console.WriteLine(address.FirstName + " \t\t " + address.LastName + " \t\t " + address.Address + " \t " + address.City +
                                " \t " + address.State + " \t " + address.Zip + " \t\t " + address.PhoneNumber + " \t " + address.Email);
            }

        }
    }
}
