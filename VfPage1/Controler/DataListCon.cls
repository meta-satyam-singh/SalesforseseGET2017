public class DataListCon {

	List<Account> accounts;

	public List<Account> getAccounts() {
		if(accounts == null) accounts = [SELECT Name FROM Account ];
		return accounts;
	}

}