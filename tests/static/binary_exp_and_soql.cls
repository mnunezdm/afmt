class A {
  {
    Account a =
      [SELECT Id FROM Account WHERE Id = '001000000FAKEID'] ?? defaultAccount;

    Account b =
      [SELECT Id FROM Account WHERE Id = '001000000FAKEID']
      ?? [SELECT Id FROM Account WHERE Id = '001000001FAKEID'];

    Account c =
      [SELECT Id FROM Account WHERE Id = '001000000FAKEID']
      ?? [
        SELECT Id
        FROM Account
        WHERE Id = '001000001FAKEID' AND Very_Long_Field_Name__c = 'Hello'
      ];

    string city =
      [SELECT BillingCity FROM Account WHERE Id = '001xx000000001oAAA']
        ?.BillingCity;
  }
}
