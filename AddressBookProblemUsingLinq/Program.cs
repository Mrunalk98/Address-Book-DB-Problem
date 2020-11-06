using System;
using System.Collections.Generic;

namespace AddressBookProblemUsingLinq
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Welcome to Address Book Problem Using Linq!");
            AddressBookRepo repo = new AddressBookRepo();
            var addressBook = repo.InsertContact();
            repo.DisplayAddressBook(addressBook);
        }
    }
}
