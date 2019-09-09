@isTest
public with sharing class jf_LinkedHashMapTest {
    @isTest
    static void putTest() {
        Test.startTest();
        jf_LinkedHashMap hm = new jf_LinkedHashMap();
        hm.put('1', 'Red');
        hm.put('2', 'Blue');
        hm.put('3', 'White');
        hm.put('4', 'Black');
        Test.stopTest();
        system.assertEquals(4, hm.size());
        system.assertEquals('Red', hm.get('1'));
        system.assertEquals('Blue', hm.get(1));
    }

    @isTest
    static void removeTest() {
        Test.startTest();
        jf_LinkedHashMap hm = new jf_LinkedHashMap();
        hm.put('1', 'Red');
        hm.put('2', 'Blue');
        hm.put('3', 'White');
        hm.put('4', 'Black');
        hm.remove('3');
        hm.remove(1);
        Test.stopTest();
        system.assertEquals(2, hm.size());
        system.assertEquals('Black', hm.get(1));
    }

    @isTest
    static void putOrderTest() {
        Test.startTest();
        jf_LinkedHashMap hm = new jf_LinkedHashMap(true, false);
        hm.put('1', 'Red');
        hm.put('2', 'Blue');
        hm.put('3', 'White');
        hm.put('4', 'Black');
        hm.put('2', 'Dark Blue');
        Test.stopTest();
        system.assertEquals(4, hm.size());
        system.assertEquals('Dark Blue', hm.get(3));
    }

    @isTest
    static void accessOrderTest() {
        Test.startTest();
        jf_LinkedHashMap hm = new jf_LinkedHashMap(false, true);
        hm.put('1', 'Red');
        hm.put('2', 'Blue');
        hm.put('3', 'White');
        hm.put('4', 'Black');
        hm.get('2');
        Test.stopTest();
        system.assertEquals(4, hm.size());
        system.assertEquals('Blue', hm.get(3));
    }

    @isTest
    static void otherMethodsTest() {
        Test.startTest();
        jf_LinkedHashMap hm = new jf_LinkedHashMap(false, true);
        hm.put('1', 'Red');
        hm.put('2', 'Blue');
        hm.put('3', 'White');
        hm.put('4', 'Black');
        Test.stopTest();
        system.assertEquals(true, hm.containsKey('1'));
        system.assertNotEquals(0, hm.hashCode());
        system.assertEquals(4, hm.keySet().size());
        system.assertEquals(4, hm.keyList().size());
        system.assertEquals(4, hm.values().size());
        hm.clear();
        system.assertEquals(0, hm.keySet().size());
    }
}