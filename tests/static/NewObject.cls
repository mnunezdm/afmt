class NewObject {
  void newListTest() {
    List<String> a = new List<String>();
    List<String> aCopy =
      new List<String>(
        veryLongVariable.getOneSet().getAnotherSet().getYetAnotherSet()
      );
    List<String> aCopy =
      new List<String>(
        superDuperVeryInsanelyLongVariableNameThatWillSurelyBreak
          .getOneSet()
          .getAnotherSet()
          .getYetAnotherSet()
      );
    List<String> aCopy =
      new List<String>(
        superDuperVeryInsanelyLongVariableNameThatWillSurelyBreak
        && anotherSuperDuperVeryInsanelyLongVariableNameThatWillSurelyBreak
      );
    List<String> aCopy = new List<String>(a);
    List<String> b = new String[]{};
    String[] c = new String[]{};
    String[] d = new String[]{ 'a', 'b' };
    String[] e =
      new String[]{ 'Long string number one', 'Long string number two' };
    String[] f = new String[1];
    String[] g = new List<String>(f);
    String[] h = new String[0];
  }

  void newSetTest() {
    Set<String> a = new Set<String>();
    Set<String> aCopy = new Set<String>(aCopy);
    Set<String> superDuperVeryInsanelyLongVariableNameThatWillSurelyBreak =
      new Set<String>();
    Set<String> aCopy =
      new Set<String>(
        veryLongVariable.getOneSet().getAnotherSet().getYetAnotherSet()
      );
    Set<String> aCopy =
      new Set<String>(
        superDuperVeryInsanelyLongVariableNameThatWillSurelyBreak
          .getOneSet()
          .getAnotherSet()
          .getYetAnotherSet()
      );
    Set<String> aCopy =
      new Set<String>(
        superDuperVeryInsanelyLongVariableNameThatWillSurelyBreak
        && anotherSuperDuperVeryInsanelyLongVariableNameThatWillSurelyBreak
      );
    Set<String> b = new Set<String>{};
    Set<String> c = new Set<String>{ 'a', 'b' };
    Set<String> c =
      new Set<String>{ 'Long string number one', 'Long string number two' };
  }

  void newMapTest() {
    Map<String, String> a = new Map<String, String>();
    Map<String, String> aCopy = new Map<String, String>(a);
    Map<String, String> superDuperVeryInsanelyLongVariableNameThatWillSurelyBreak =
      new Map<String, String>();
    Map<String, String> aCopy =
      new Map<String, String>(
        veryLongVariable.getOneSet().getAnotherSet().getYetAnotherSet()
      );
    Map<String, String> aCopy =
      new Map<String, String>(
        superDuperVeryInsanelyLongVariableNameThatWillSurelyBreak
          .getOneSet()
          .getAnotherSet()
          .getYetAnotherSet()
      );
    Map<String, String> aCopy =
      new Map<String, String>(
        superDuperVeryInsanelyLongVariableNameThatWillSurelyBreak
        && anotherSuperDuperVeryInsanelyLongVariableNameThatWillSurelyBreak
      );
    Map<String, String> b = new Map<String, String>{};
    Map<String, String> c = new Map<String, String>{ 'a' => 'b', 'c' => 'd' };
    Map<String, String> c =
      new Map<String, String>{
        'Long string key' => 'Long string value',
        'Long string key two' => 'Long string value two'
      };
    Map<String, String[]> d =
      new Map<String, String[]>{
        'a' => new String[]{ 'a', 'b' },
        'b' => new String[]{ 'c', 'd' }
      };
    Map<String, Decimal> fmaIntegerParameterNameDefaultValue =
      new Map<string, decimal>{
        'Parameter1' => 1,
        'Parameter2' => 0,
        'Parameter3' => 500
      };
  }

  void newKeyValueTest() {
    Account a = new Account(Name = 'Account Name');
    Account b =
      new Account(
        Name = 'Account Name',
        Description = 'Account Description That Is Very Long'
      );
    Account b =
      new Account(
        Name = 'Account Name',
        Description =
          'Account Description That Is Very Long'
          + 'Some Other Description That Is Also Very Long'
      );
    Account account =
      new Account(
        Body__c =
          JSON.serialize(
            new Map<String, Object>{ 'Content' => 'Hello', 'World' => 'There' }
          )
      );
    Account account =
      new Account(
        Body__c =
          JSON.serialize(
            new Map<String, Object>{
              'Content' => 'Hello',
              'World' => 'There',
              'Hi' => 'Yes'
            }
          )
      );
  }

  void newStandardTest() {
    JWS a = new JWS('payload', 'certDevName');
    JWS b =
      new JWS(
        'Very long payload but still fit in one line',
        'very long cert dev name'
      );
    JWS c =
      new JWS(
        'Very long payload that is definitely too long so that all the parent groups must break',
        'very long cert dev name'
      );
  }

  void newComplicatedTypesTest() {
    Map<String, Map<String, String>> a =
      new Map<String, Map<String, String>>{
        'a' => new Map<String, String>{ 'b' => 'c' },
        'd' => new Map<String, String>{ 'e' => 'f' }
      };
    Map<String, List<String>> b =
      new Map<String, List<String>>{ 'b' => new List<String>{ 'c', 'd', 'e' } };
    Map<List<String>, List<String>> c =
      new Map<List<String>, List<String>>{
        new List<String>{ 'a' } => new List<String>{ 'b', 'c' },
        new List<String>{ 'd' } => new List<String>{ 'e', 'f' }
      };
    List<List<String>> d = new List<List<String>>(5);
  }
}
