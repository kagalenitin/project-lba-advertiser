package com.LBA.Advertiser.bean;

public class GlobalBean {
	public static String usersession;
	public static String firstname;
	public static String lastname;
	public static String companyname;
	
	/**
	 * @return the firstname
	 */
	public static String getFirstname() {
		return firstname;
	}

	/**
	 * @param firstname the firstname to set
	 */
	public static void setFirstname(String firstname) {
		GlobalBean.firstname = firstname;
	}

	/**
	 * @return the lastname
	 */
	public static String getLastname() {
		return lastname;
	}

	/**
	 * @param lastname the lastname to set
	 */
	public static void setLastname(String lastname) {
		GlobalBean.lastname = lastname;
	}

	/**
	 * @return the companyname
	 */
	public static String getCompanyname() {
		return companyname;
	}

	/**
	 * @param companyname the companyname to set
	 */
	public static void setCompanyname(String companyname) {
		GlobalBean.companyname = companyname;
	}

	/**
	 * @return the usersession
	 */
	public static String getUsersession() {
		return usersession;
	}

	/**
	 * @param usersession the usersession to set
	 */
	public static void setUsersession(String usersession) {
		GlobalBean.usersession = usersession;
	}
	
}
