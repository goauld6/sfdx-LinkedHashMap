public with sharing class jf_LinkedHashMap {
    private Map<String, Object> innerMap = new Map<String, Object>();
    private List<String> linkedKeyList = new List<String>();
    private boolean putOrder;
    private boolean accessOrder;

    public jf_LinkedHashMap() {
        this.putOrder = false;
        this.accessOrder = false;
    }

    public jf_LinkedHashMap(boolean putOrder, boolean accessOrder) {
        this.putOrder = putOrder;
        this.accessOrder = accessOrder;
    }

    public void clear() {
        this.innerMap.clear();
        this.linkedKeyList.clear();
    }

    public boolean containsKey(String key) {
        return this.innerMap.containsKey(key);
    }

    public object get(String key) {
        if (this.accessOrder) {
            this.tailKey(key);
        }
        return this.innerMap.get(key);
    }

    public object get(Integer index) {
        if (index >= 0 && index < this.linkedKeyList.size()) {
            return this.get(this.linkedKeyList[index]);
        }
        return null;
    }

    public Integer hashCode() {
        return this.innerMap.hashCode();
    }

    public Set<String> keySet() {
        return this.innerMap.keySet();
    }

    public List<String> keyList() {
        return this.linkedKeyList;
    }

    public void put(String key, Object value) {
        if (this.innerMap.containsKey(key)) {
            if (this.putOrder) {
                this.tailKey(key);
            }
            this.innerMap.put(key, value);
        }
        else {
            this.innerMap.put(key, value);
            this.linkedKeyList.add(key);
        }
    }

    public List<Object> values() {
        List<Object> vl = new List<Object>();
        for (String key : this.linkedKeyList) {
            vl.add(this.innerMap.get(key));
        }
        return vl;
    }

    public Integer size() {
        return this.innerMap.size();
    }

    public void remove(String key) {
        for (Integer i = 0; i < linkedKeyList.size(); i++) {
            if (this.linkedKeyList.get(i) == key) {
                this.innerMap.remove(key);
                this.linkedKeyList.remove(i);
            }
        }
    }

    public void remove(Integer index) {
        if (index >= 0 && index < this.linkedKeyList.size()) {
            this.remove(this.linkedKeyList[index]);
        }
    }

    private void tailKey(String key) {
        for (Integer i = 0; i < linkedKeyList.size(); i++) {
            if (this.linkedKeyList.get(i) == key) {
                this.linkedKeyList.remove(i);
                this.linkedKeyList.add(key);
            }
        }
    }
}