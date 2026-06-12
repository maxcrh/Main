@isTest
private class AnimalLocatorTest {
    @istest static void AnimalLocatorMock1(){
        Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock());
        string result = AnimalLocator.getAnimalNameById(3);
        string expectedResult = 'cow';
        System.assertEquals(result, expectedResult);
    }
}