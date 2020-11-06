using System;
using System.Collections.Generic;
using System.Data;
using System.Text;

namespace AddressBookProblemUsingLinq
{
    public class AddressBookRepo
    {
        public static string FIRST_NAME = "FirstName";
        public static string LAST_NAME = "LastName";
        public static string ADDRESS = "Address";
        public static string CITY = "City";
        public static string STATE = "State";
        public static string ZIP = "Zip";
        public static string PHONE_NUMBER = "PhoneNumber";
        public static string EMAIL = "Email";

        public AddressBook addressBook = new AddressBook();
        public void CreateAddressBook()
        {
            DataTable AddressBookTable = new DataTable();
            AddressBookTable.Columns.Add(FIRST_NAME);
            AddressBookTable.Columns.Add(LAST_NAME);
            AddressBookTable.Columns.Add(ADDRESS);
            AddressBookTable.Columns.Add(CITY);
            AddressBookTable.Columns.Add(STATE);
            AddressBookTable.Columns.Add(ZIP);
            AddressBookTable.Columns.Add(PHONE_NUMBER);
            AddressBookTable.Columns.Add(EMAIL);
        }
    }
}
