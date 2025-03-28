class SOSLClass {
  void simpleSOSL() {
    String a = 'Hello';
    List<List<SObject>> searchResult = [FIND 'FirstLastName'];
    searchResult = [FIND :a];
    searchResult = [FIND :a USING PHRASE SEARCH];
    searchResult = [FIND :a USING ADVANCED SEARCH];
  }

  void hardlineHeuristics() {
    List<List<SObject>> searchResult = [FIND 'FirstLastName'];
    searchResult = [FIND :a USING PHRASE SEARCH];
  }

  void inClause() {
    List<List<SObject>> searchResult;
    searchResult = [FIND 'Hello' IN ALL FIELDS];
    searchResult = [FIND 'Hello' IN EMAIL FIELDS];
    searchResult = [FIND 'Hello' IN NAME FIELDS];
    searchResult = [FIND 'Hello' IN PHONE FIELDS];
    searchResult = [FIND 'Hello' IN SIDEBAR FIELDS];
  }
  void withDivisionClause() {
    List<List<SObject>> searchResult;
    String a = 'Local';
    searchResult = [FIND 'Hello' WITH DIVISION = 'Global'];
    searchResult = [FIND 'Hello' WITH DIVISION = :a];
    searchResult = [FIND 'foobar' RETURNING Account WITH DIVISION = 'global'];
  }
  void withDataCategory() {
    List<List<SObject>> searchResult;
    String a = 'Local';
    searchResult = [FIND 'Hello' WITH DATA CATEGORY Location__c AT America__c];
    searchResult = [
      FIND 'Hello'
      WITH DATA CATEGORY
        Geography__c ABOVE France__c
        AND Product__c AT mobile_phones__c
    ];
    searchResult = [
      FIND 'Hello'
      WITH DATA CATEGORY Geography__c BELOW Europe__c
    ];
  }
  void withSnippet() {
    List<List<SObject>> searchResult;
    String a = 'Local';
    searchResult = [FIND 'Hello' WITH SNIPPET];
    searchResult = [FIND 'Hello' WITH SNIPPET(TARGET_LENGTH = 120)];
  }
  void withNetwork() {
    List<List<SObject>> searchResult;
    searchResult = [FIND 'Hello' WITH NETWORK = 'NetworkId'];
    searchResult = [
      FIND 'Hello'
      WITH NETWORK IN ('NetworkId1', 'NetworkId2', 'NetworkId3')
    ];
    searchResult = [FIND 'Hello' WITH NETWORK = '00000000000000'];
    searchResult = [
      FIND 'Hello'
      WITH NETWORK IN (
        'NetworkId1',
        'NetworkId2',
        'NetworkId3',
        'NetworkId4',
        'NetworkId5',
        'NetworkId6'
      )
    ];
  }
  void withPricebookId() {
    List<List<SObject>> searchResult;
    searchResult = [FIND 'Hello' WITH PriceBookId = '01sxx0000002MffAAE'];
    searchResult = [
      FIND 'Hello'
      WITH PriceBookId = '01sxx0000002MffAAE'
      WITH PriceBookId = '01sxx0000002MffAAE'
      WITH PriceBookId = '01sxx0000002MffAAE'
    ];
  }
  void withMetadata() {
    List<List<SObject>> searchResult;
    searchResult = [FIND 'Hello' WITH METADATA = 'LABELS'];
  }
  void withHighlight() {
    List<List<SObject>> searchResult;
    searchResult = [FIND 'Hello' WITH HIGHLIGHT];
  }
  void withSpellCorrection() {
    List<List<SObject>> searchResult;
    searchResult = [FIND 'Hello' WITH SPELL_CORRECTION = true];
    searchResult = [FIND 'Hello' WITH SPELL_CORRECTION = false];
  }
  void returning() {
    List<List<SObject>> searchResult;
    String a = 'World';
    List<String> multiple = new List<String>{ 'Hi', 'World' };
    searchResult = [FIND 'Hello' RETURNING Contact];
    searchResult = [FIND 'Hello' RETURNING Contact, Lead];
    searchResult = [FIND 'Hello' RETURNING Account(Name)];
    searchResult = [FIND 'Hello' RETURNING Contact(FirstName, LastName)];
    searchResult = [FIND 'Hello' RETURNING CustomObject__c(CustomField__c)];
    searchResult = [
      FIND 'Hello'
      RETURNING Contact(FirstName, LastName LIMIT 10), Account(Name, Industry)
    ];
    searchResult = [
      FIND 'Hello'
      RETURNING
        Contact(FirstName, LastName ORDER BY FistName ASC),
        Account,
        Lead(FirstName)
    ];
    searchResult = [
      FIND 'Hello'
      RETURNING
        Contact(FirstName, LastName ORDER BY LastName DESC LIMIT 20),
        Account(Name, Industry LIMIT 10),
        Opportunity
      LIMIT 50
    ];
    searchResult = [
      FIND 'Hello'
      RETURNING Contact(FirstName, LastName OFFSET 10)
    ];
    searchResult = [
      FIND 'Hello'
      IN ALL FIELDS
      RETURNING Account(Id, Name USING ListView = ListViewName)
    ];
    searchResult = [
      FIND 'test'
      RETURNING Account(id WHERE createddate = THIS_FISCAL_QUARTER)
    ];
    searchResult = [FIND 'test' RETURNING Account(id, Name WHERE Name = :a)];
    searchResult = [FIND 'test' RETURNING Account(id WHERE NAME IN :multiple)];
    searchResult = [
      FIND 'San Francisco'
      RETURNING
        My_Custom_Object__c(
          Id
          WHERE
            DISTANCE(My_Location_Field__c, GEOLOCATION(37, 122), 'mi') < 100)
    ];
  }
  void updateStat() {
    List<List<String>> searchResult;
    searchResult = [
      FIND 'Title'
      RETURNING
        FAQ__kav(
          Title
          WHERE
            PublishStatus = 'Online'
            AND language = 'en_US'
            AND KnowledgeArticleVersion = 'ka230000000PCiy')
      UPDATE VIEWSTAT
    ];
    searchResult = [
      FIND 'Keyword'
      RETURNING
        KnowledgeArticleVersion(
          Title
          WHERE PublishStatus = 'Online' AND language = 'en_US')
      UPDATE TRACKING
    ];
    searchResult = [
      FIND 'Keyword'
      RETURNING
        KnowledgeArticleVersion(
          Title
          WHERE PublishStatus = 'Online' AND language = 'en_US')
      UPDATE TRACKING, VIEWSTAT
    ];
  }
}
